class Array
  def find_dups
      uniq.map {|v| (self - [v]).size < (self.size - 1) ? v : nil}.compact
  end
end

# frozen_string_literal: true
class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    graph_nodes = []
    graph_edges = []
    crossfit_graph_nodes = []
    crossfit_graph_edges = []
    design_graph_nodes = []
    design_graph_edges = []

    all_notes = site.collections['notes'].docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    # Convert all Wiki/Roam-style double-bracket link syntax to plain HTML
    # anchor tag elements (<a>) with "internal-link" CSS class
    all_docs.each do |current_note|
      all_docs.each do |note_potentially_linked_to|
        current_note.content = current_note.content.gsub(
          /\[\[#{note_potentially_linked_to.data['title']}\]\]/i,
          "<a class='internal-link' href='#{note_potentially_linked_to.url}'>#{note_potentially_linked_to.data['title']}</a>"
        )
      end
    end

    # Identify note backlinks and add them to each note
    all_notes.each do |current_note|
			# Nodes: Jekyll
      notes_linking_to_current_note = all_notes.filter do |e|
        e.content.include?(current_note.url)
      end

      # Nodes: Graph
      graph_nodes << {
        id: note_id_from_note(current_note),
        path: current_note.url,
        label: current_note.data['title'],
      } unless current_note.path.include?('_notes/index.html')

			# Edges: Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges: Graph
      notes_linking_to_current_note.each do |n|
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }

        if current_note.data['tags'].include?("CrossFit")
          crossfit_graph_nodes << {
            id: note_id_from_note(current_note),
            path: current_note.url,
            label: current_note.data['title'],
          } unless current_note.path.include?('_notes/index.html')
        end

        if current_note.data['tags'].include?("CrossFit")
          notes_linking_to_current_note.each do |n|
            if n.data['tags'].include?("CrossFit")
            crossfit_graph_edges << {
              source: note_id_from_note(n),
              target: note_id_from_note(current_note),
            }
            end
          end
        end

        if current_note.data['tags'].include?("design")
          design_graph_nodes << {
            id: note_id_from_note(current_note),
            path: current_note.url,
            label: current_note.data['title'],
          } unless current_note.path.include?('_notes/index.html')
        end

        if current_note.data['tags'].include?("design")
          notes_linking_to_current_note.each do |n|
            if n.data['tags'].include?("design")
              design_graph_edges << {
              source: note_id_from_note(n),
              target: note_id_from_note(current_note),
            }
            end
          end
        end
      end
    end



    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges.uniq!,
      nodes: graph_nodes,
    }))

    File.write('_includes/crossfit_notes_graph.json', JSON.dump({
      edges: crossfit_graph_edges.uniq!,
      nodes: crossfit_graph_nodes.uniq!,
    }))

    File.write('_includes/design_notes_graph.json', JSON.dump({
      edges: design_graph_edges.uniq!,
      nodes: design_graph_nodes.uniq!,
    }))
  end

  def note_id_from_note(note)
    note.data['title'].delete(' ').delete('-').to_i(36).to_s
  end
end
