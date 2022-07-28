class Array
  def find_dups
      uniq.map {|v| (self - [v]).size < (self.size - 1) ? v : nil}.compact
  end
end

# frozen_string_literal: true
class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    sub_graph_nodes = {}
    sub_graph_edges = {}

    tags = site.config["graph"]
    tags.each do |tag|
      sub_graph_nodes.merge!({"#{tag}": []})
      sub_graph_edges.merge!({"#{tag}": []})
    end

    all_notes = site.collections['notes'].docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    # Convert all Wiki/Roam-style double-bracket link syntax to plain HTML
    # anchor tag elements (<a>) with "internal-link" CSS class
    all_docs.each do |current_note|
      all_docs.each do |note_potentially_linked_to|
        current_note.content = current_note.content.gsub(
          /\[\[#{note_potentially_linked_to.data['title']}\]\]/i,
          "<a class='internal-link' href='#{note_potentially_linked_to.url | downcase }'>#{note_potentially_linked_to.data['title']}</a>"
        )
      end
    end

    # Identify note backlinks and add them to each note
    all_notes.each do |current_note|
			# Nodes: Jekyll
      notes_linking_to_current_note = all_notes.filter do |e|
        e.content.include?(current_note.url.downcase)
      end

      sub_graph_nodes.each {|key, value| 
        if current_note.data['tags'].include?("#{key}")
          value << {
            id: note_id_from_note(current_note),
            path: current_note.url.downcase,
            label: current_note.data['title'],
          } unless current_note.path.include?('_notes/index.html')
        end
        value.uniq!
      }

			# Edges: Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges: Graph
        notes_linking_to_current_note.each do |n|
          sub_graph_edges.each {|key, value|
            if current_note.data['tags'].include?("#{key}")
              notes_linking_to_current_note.each do |n|
                if n.data['tags'].include?("#{key}")
                  value << {
                    source: note_id_from_note(n),
                    target: note_id_from_note(current_note),
                  }
                end
                value.uniq!
              end
            end
          }
        end
    end


    File.write("_includes/tagged_notes_graph.json", JSON.dump({
      edges: sub_graph_edges,
      nodes: sub_graph_nodes,
    }))

  end


  def generate_tag_hash(site)

  end
  def note_id_from_note(note)
    note.data['title'].delete(' ').delete('-').to_i(36).to_s
  end
end
