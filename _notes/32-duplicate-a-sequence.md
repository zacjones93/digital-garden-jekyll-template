---
title: 32 - Duplicate a Sequence
---

# Table of Contents

1.  [Solution](#orgfb3ee47)
2.  [How to get there](#org598bc97)

## Intro
Sequences are a huge concept in lisp and they are hard for me to wrap my brain around. Problem solving for them is showing me that I need to think about the solution to the problem in ways I'm not used to.

Bellow is my implementation for [Duplicate a Sequence](http://www.4clojure.com/problem/32) problem on 4clojure.

I don't know if it's efficient or not. 🙂

<a id="orgfb3ee47"></a>

## Solution

    (fn [x] (sort (take (* 2 (count x)) (cycle x))))


<a id="org598bc97"></a>

## How to get there

    (= (__ [1 2 3]) '(1 1 2 2 3 3))
    (= (__ [:a :a :b :b]) '(:a :a :a :a :b :b :b :b))
    (= (__ [[1 2] [3 4]]) '([1 2] [1 2] [3 4] [3 4]))
    (= (__ [[1 2] [3 4]]) '([1 2] [1 2] [3 4] [3 4]))

I knew I wanted to work through the sequence and on each item, duplicate. At first I was thinking I would map the function but couldn't figure out how to actually operate on each value to create a new sequence.. ([Ian Jones](https://www.ianjones.us/) figured it out with apply).

I learned about `cycle` which will return to you an infinite amount of numbers to you from a sequence. You can use this in tandem with `take` to grab the right amount of items in the sequence.

In the first test case, you have 3 items in a vector. I used this to iterate and get to a solution I was happy with before thinking about other cases.

    (take 6 (cycle [1 2 3]))

```
| 1 | 2 | 3 | 1 | 2 | 3 |
```

Here you can see that I am getting all the right numbers, but they are not duplicated in place.. the `cycle` is cycling.

This is a easy fix with `sort`.

    (sort (take 6 (cycle [1 2 3])))

```
| 1 | 1 | 2 | 2 | 3 | 3 |
```

Cool. I passed the first test. How do I make this generic so that I can pass any size of sequence?

I'll focus on the `take 6` and try to produce 6 with by passing `[1 2 3]`.

    (count [1 2 3])

```
: 3
```

So applying `count` to the sequence will get me half of the number I need.. I know how to multiply, so I'll try that

    (* 2 (count [1 2 3]))

```
: 6
```

Boom, I got the right number. Lets insert this in the original function.

    (sort (take (* 2 (count [1 2 3])) (cycle [1 2 3])))

```
| 1 | 1 | 2 | 2 | 3 | 3 |
```

Now we're cooking.

If you define this as a function you should be set for any sequence.

    (defn dupseq [x] (sort (take (* 2 (count x)) (cycle x))))
    
    (dupseq [1 2 3])
    (dupseq [:a :a :b :b])
    (dupseq [[1 2] [3 4]])

```
| #'user/dupseq             |
| (1 1 2 2 3 3)             |
| (:a :a :a :a :b :b :b :b) |
| ([1 2] [1 2] [3 4] [3 4]) |
```