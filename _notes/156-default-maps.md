---
title: 156 - Default Maps
---

# Table of Contents

1.  [156 Map Defaults](#org45e9618)
    1.  [Problem](#orgbaa75e6)
    2.  [Solution](#org2d1f286)


<a id="org45e9618"></a>

# 156 Map Defaults


<a id="orgbaa75e6"></a>

## Problem
[link](http://www.4clojure.com/problem/156)

When retrieving values from a map, you can specify default values in case the key is not found:

(= 2 (:foo {:bar 0, :baz 1} 2))

However, what if you want the map itself to contain the default values? Write a function which takes a default value and a sequence of keys and constructs a map.


<a id="org2d1f286"></a>

## Solution

The test cases that I was given were:

    (= (__ 0 [:a :b :c]) {:a 0 :b 0 :c 0})
    test not run
    (= (__ "x" [1 2 3]) {1 "x" 2 "x" 3 "x"})
    test not run
    (= (__ [:a :b] [:foo :bar]) {:foo [:a :b] :bar [:a :b]})

Right away I noticed that we need to &rsquo;do work&rsquo; on each item in the collection that&rsquo;s passed into the function. This makes me think that `map` will be what I reach for.

Start with the first test case as it&rsquo;s the simplest (in my mind) to think about. I personally like to define an anonymous function with `fn` since it makes the values you pass in explicit (vs the `#()` syntax).

This is where I&rsquo;ll start:

    ((fn [dv col] (map () col)) 0 [:a :b :c])

`col` is passed into the `map` since we want to iterate over `[:a :b :c]`. I know I want to associate a key to a value when `map` visits each value in the collection. This is when we&rsquo;ll reach for `assoc` as it does just that.

You&rsquo;ll also notice that we are passing in the value that we want to use for each key - value pair as `dv`.

    ((fn [dv col] (map (fn [key] (assoc {} key dv)) col)) 0 [:a :b :c])

The function that is defined for our map takes in a value which we will use as the key in our resulting map. In that function we will tell `assoc` that we want a hash-map by passing in `{}`. Then we&rsquo;ll set the key to `key` which is passed in from the map and we&rsquo;ll set the value in that hash-map to `dv` which is accessible because the top level function is a closure.

The results are:

    {:a 0} {:b 0} {:c 0}

This isn&rsquo;t quite what we want since we have 3 separate hash-maps. That&rsquo;s actually a decent fix because `merge` exists.

    ((fn [dv col] (reduce merge (map (fn [key] (assoc {} key dv)) col))) 0 [:a :b :c])

By using reduce with merge, we can combine the individual hash-maps into one large one. This passes the test case above!

    {:a 0 :b 0 :c 0}

As it turns out, I implemented a naive version of `zipmap`.

-   **zipmap:** Returns a map with the keys mapped to the corresponding vals.

A big part of learning clojure has been knowing what core functions are available to you. If you utilize zip map.. you can shorten the implementation by quite a bit

    ((fn [dv col] (zipmap col (repeat dv))) 0 [:a :b :c])

This produces the same results. If you want to get the best golf score possible, use shorthand like [[Ian Jones]] does.

    (#(zipmap %2 (repeat %1)) 0 [:a :b :c])

