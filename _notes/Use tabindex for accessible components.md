---
title: Use tabindex for accessible components
tags: dev
---

Recently I've been working on a [template](https://github.com/eggheadio/portfolio-template-and-challenge) for developers to start their portfolio with. 

I ran into an issue where my `ProjectCards` and `PostCards` were being skipped when you tab around the site. I want these to be navigated to by everyone so knew I needed to add them to the pages `tabindex`.

The naive solution is to start adding tabindex to all of your links on a page ordering them 1, 2, 3.. etc but this is duplicating all the effort that the browser structure is already doing (better than you'll manage, assuming a coherent page structure).

After a little research, I found that you can set an elements `tabIndex={0}` (I'm in React land) and it will insert that element whereever it would naturally fit into a page. This solves the issue I was having exactly.

```js
<Link href={`/projects/${project.slug}`}>
  <a 
    tabIndex={0} 
    className='px-6 py-8 rounded cursor-pointer w-fit h-fit bg-slate-100 hover:ring-2 ring-secondary focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-secondary'
  >
    <div className='flex flex-col mx-auto w-fit'>
      <div>
      </div>
      <Image
        height={211} width={288}
        className="rounded-lg"
        src={project.images[0].src} alt={project.images[0].alt} />
      <h2 className='mt-8 text-lg w-fit '>{project.title}</h2>
      <p className='mt-4 text-base w-72 line-clamp-4'>{project.summary}</p>
    </div>
  </a>
</Link>
```


I found out about the different values of tabindex [here](https://www.tpgi.com/using-the-tabindex-attribute/)

tl;dr

tabindex=0 inserts the element in the tab order based off of existing html structure.

tabindex=-1 removes element from tab order but can be focused programatically

tabindex=1+ hijacks natural tab order with the browser giving your order preference (don't do this!).
