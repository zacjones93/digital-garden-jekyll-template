---
layout: page
title: Home
id: home
image: assets/og-image-v2.png
permalink: /
---

<div class="phone-hero">
    <div>
      <img style="margin: auto;
                  width: 75px;
                  height: 75px;
                  " 
           src="../../assets/logo-400.png">
      <h1 class="content-fit" style=" margin:auto; margin-top: 1em;"> Welcome!</h1>
    </div>
    <p>
      This site is a collection of my thoughts that are organized into notes. They all very in length and polish.
    </p>
    <p>
      Some will be quick notes for a specific task at hand that I found useful to have on the internet and others will dig deeper into the big ideas surrounding a topic.
    </p>
    <p>Currently there are four main categories that I am exploring:</p>
</div>

<div class="laptop-hero" style="position: relative; overflow: hidden;">
  <div class="text-wrapper">
    <h1 style="margin-top: 0;"> Welcome!</h1>
    <p>
      This site is a collection of my thoughts that are organized into notes. They all very in length and polish.
    </p>
    <p>
      Some will be quick notes for a specific task at hand that I found useful to have on the internet and others will dig deeper into the big ideas surrounding a topic.
    </p>
    <p>Currently there are four main categories that I am exploring:</p>
  </div>
    <img class="plant-hero" style="position: absolute; margin-top: 3em; opacity: 0;" src="../../assets/logo-400.png">
</div>


<div class="breakout">
  <div class="cards" style="display: flex; justify-content: center; flex-wrap: wrap;">
    <div class="card-wrapper">
      <div>
      <img class="image-small" src="../../assets/logo-small.png">
      <h1 class="card-h1">
        [[Design]]
      </h1>
      <p class="card-p">
        Crafting intent through whatever medium you find yourself in whether it's UI, learning design, or other.
      </p>
      </div>
    </div>
    <div class="card-wrapper">
      <div>
      <img class="image-small" src="../../assets/logo-small.png">
      <h1 class="card-h1">
        [[Business]]
      </h1>
      <p class="card-p">
        The art of making money, mostly online, and everything that entails.
      </p>
      </div>
    </div>
    <div class="card-wrapper">
      <div>
      <img class="image-small" src="../../assets/logo-small.png">
      <h1 class="card-h1">
        [[Dev]]
      </h1>
      <p class="card-p">
        Building websites and programs with various languages and techniques.
      </p>
      </div>
    </div>
    <div class="card-wrapper">
      <div>
      <img class="image-small" src="../../assets/logo-small.png">
      <h1 class="card-h1">
        [[crossfit]]
      </h1>
      <p class="card-p">
        The way I achieve [[health]] and increase my [[healthspan]].
      </p>
      </div>
    </div>
  </div>
</div>

<div class="article-flex ">
  <div class="content-fit article-child-align">
    <h2 class="content-fit sm-center-content">Articles & Prominent Notes</h2>
    <ul>
      <li>[[Utilize the Implicit Grid for consistent design of UI Elements]]</li>
      <li>[[Understanding by Design]]</li>
      <li>[[High Quality Screen Casts Are Well-Scoped with a Single Take-Away]]</li>
      <li>[[Sales Safari]]</li>
      <li>[[Handle Multiple Inputs in React with ES6 Computed Property Name]]</li>
      <li>[[Christopher Alexanders System Design]]</li>
    </ul>
  </div>
  <div class="content-fit article-child-align">
    <h2 class="content-fit sm-center-content">Projects</h2>
    <ul>
      <li>egghead.io -- <a href="https://github.com/eggheadio/egghead-next/pull/602">PR showcase pulling Sanity data into a Next.js site</a></li>
      <li>egghead-kenv -- <a href="https://github.com/zacjones93/egghead-kenv">collection of internal team scripts and tools</a></li>
      <li>[[shoulditrain.today]]</li>
    </ul>
    <h2 class="content-fit sm-center-content">Book Reviews & Notes</h2>
    <ul>
      <li>[[Badass Making Users Awesome]]</li>
      <li>[[The Mom Test]]</li>
    </ul>
  </div>
</div>




<style>
  .phone-hero {
    display: block;
  }
  .laptop-hero {
    display: none;
  }
  .wrapper {
    max-width: 54em;
    margin: auto;
  }
  
  .text-wrapper {
    max-width: 23em;
  }
  .image-small {
    width: 50px; height: 50px;
  }
  .card-wrapper {
    padding: 1em;
    margin: .5em;
    background: #CCF2D4; 
    border-radius: 4px; 
    border: 1px solid #27D6B8; 
    width: 12em
  }
  .content-fit {
    width: fit-content;
  }
  .sm-center-content {
    margin: auto;
  }
  .card-h1 {
    width: fit-content; 
    margin: auto;
  }
  .card-p {
    height: 7em;
  }
  .breakout {
    margin:1em -100%; /* old browsers fallback */
    margin:1em calc(50% - 50vw);
    margin-bottom: 3em;
  }

  .article-flex {
    display: flex;
    flex-direction: column;
  }
  
  .article-child-align {
    justify-self: center
  }



  @media screen and (min-width: 800px) {
    .phone-hero {
      display: none;
    }
    .laptop-hero {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      margin-top: 1em;
      margin-bottom: 3em;
    }
    .article-flex {
      flex-direction: row;
    }
    .article-child-align {
      justify-self: auto;
    }
    .sm-center-content {
      margin: 0;
    }
  }
</style>
 