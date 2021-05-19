---
title: Vue Fundamentals Portfolio Project Design Assets
---

## Intro
[[Vue Fundamentals]]is a course that [[Kevin Cunningham]]is producing that I am advising him on. Part of that process is developing a [[Portfolio Project]] that learners can complete that will prove to themselves and others that they understand Vue at a fundamental level.

Kevin made [a Vue starter app](https://github.com/doingandlearning/vue-fundamentals-challenge) that will serve up the data needed for the challenge.

## Design Product Cards
The project involves a hardware store that needs an index of product cards displayed with relevant information.

It needed designs which is where I contribute. I started with the product card.

Here's V1: 
![first version of the product card](./product-card-old.png)

This looks alright. I started with the [[typography]] and designated the font sizes that I would use for the design. Consistent [[font size]] is key. 

The most significant aspects of the card are the price and the action for people to buy. Everything else falls around these two elements.

![typography definitions for the Vue Project](./vue-fundamentals-typography.png)

A big flaw in this design is the use of negative space throughout the card. Just like with Typography, negative space and spacing should consistent in your application.

You might not notice that there are quite a few different spacings going on but over-all it combines into a sloppy looking card where 'something is off.'

![Spacing highlighted in the product card](./product-card-spacing.png)

When the spacing is highlighted, you can see really well that the spacing in the card is sloppy. Nothing is consistent and this results in the card looking off.

This is where [[implicit grid]] helps.

![implicit grid applied](./product-card-detail.png)