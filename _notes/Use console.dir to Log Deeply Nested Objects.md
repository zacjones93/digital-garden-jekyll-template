---
title: Use console.dir to Log Deeply Nested Objects
tags: [dev]
---

When you are working in JavaScript, a lot of the time you find yourself logging out values to see if you're on the right track.

One issue I find myself having is nested objects don't display when `console.log`ing them.

To fix this use `console.dir`

```js
let obj = {
      products: [
        {tool: {
          "id": 321001,
          "name": "DHP485SFE 18V 3.0Ah Li-Ion LXT Brushless Cordless Combi Drill (",
          "manufacturer": "Makita",
          "category": "Drills",
          "image": "https://res.cloudinary.com/kc-cloud/image/upload/v1618064911/vue-fundamentals/ae235_pn5koq.jpg",
          "quantityInStock": 26,
          "price": 159.99
        }}
      ]
  }
```

### console.log(obj) output

```js
{ products: [ { tool: [Object] } ] }
```

### console.dir(obj, {depth: null}) output

```js
{
  products: [
    {
      tool: {
        id: 321001,
        name: 'DHP485SFE 18V 3.0Ah Li-Ion LXT Brushless Cordless Combi Drill (',
        manufacturer: 'Makita',
        category: 'Drills',
        image: 'https://res.cloudinary.com/kc-cloud/image/upload/v1618064911/vue-fundamentals/ae235_pn5koq.jpg',
        quantityInStock: 26,
        price: 159.99
      }
    }
  ]
}
```