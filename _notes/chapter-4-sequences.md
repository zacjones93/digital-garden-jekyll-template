---
title: Chapter 4 - Sequences
---


# Table of Contents

- [Table of Contents](#table-of-contents){: .internal-link}
- [Chapter 4: Sequences](#chapter-4-sequences){: .internal-link}
  - [Recursion](#recursion){: .internal-link}
  - [generalizing](#generalizing){: .internal-link}
  - [Building sequences](#building-sequences){: .internal-link}
  - [Tansforming Sequences](#tansforming-sequences){: .internal-link}
  - [Subsequences](#subsequences){: .internal-link}
  - [Collapsing sequences](#collapsing-sequences){: .internal-link}
  - [Collapse a Sequence with reduce](#collapse-a-sequence-with-reduce){: .internal-link}
  - [Putting it together](#putting-it-together){: .internal-link}


<a id="org9058a45"></a>

# Chapter 4: Sequences


<a id="org483367d"></a>

## Recursion

    (defn inc-more [nums]
      (if (first nums)
        ; If there's a first number, build a new list with cons
        (cons (inc (first nums))
              (inc-more (rest nums)))
        ; If there's no first number, just return an empty list
        (list)))
    
    (inc-more [1 2 3 4])

Cons adds the first item -that just got incremented- of a list back into the list.
then you incrementally work through the rest of the list by recursing and calling rest.

The stack looks like this:

> (cons 2 (cons 3 (cons 4 (cons 5 &rsquo;()))))
> (cons 2 (cons 3 (cons 4 &rsquo;(5))))
> (cons 2 (cons 3 &rsquo;(4 5)))
> (cons 2 &rsquo;(3 4 5))
> &rsquo;(2 3 4 5)

Basecase is returning an empty list.
Inductive case (recurrence relation) - how the problem was broken up into incrementing the first number in the sequence.


<a id="orgbd62607"></a>

## generalizing

    (defn transform-all [f xs]
      (if (first xs)
        (cons (f (first xs))
              (transform-all f (rest xs)))
        (list)))

there isn&rsquo;t anything special going on with inc and the function can be generalized.

In short, this function expresses a sequence in which each element is some function applied to the corresponding element in the underlying sequence. This idea is so important that it has its own name, in mathematics, Clojure, and other languages. We call it map .

    (map inc [1 2 3 4])


<a id="org1b016f1"></a>

## Building sequences

    (take 5 (iterate (fn [x] (str x "o")) "y"))

    (take 10 (repeat :hi))

`take` will call the `repeat` function as many times as you want, it&rsquo;s infinite.

range will build a sequence of numbers `(range n m step)`

    (range 0 100 5)

Extend and repeate a sequence, use cycle.

    (take 10 (cycle [1 2 3]))

`rand` is an impure function becasue it cannot be replaced by the same value every time.

`range` generates a sequence of numbers between two points. If you give it one number, it will generate from 0 to that number. If you give two arguments it will generate between the two numbers. The third arguement is the step.

    (take 10 (cycle [1 2 3]))


<a id="org0f24744"></a>

## Tansforming Sequences

-   **map:** finds a related sequence based on the one that you pass in.
    map will zip two sequences together.
    it stops at the smaller sequence end.
    
        (map-indexed
         (fn [index element]
           (str index ". " element))
         ["erlang" "ruby" "haskell"])
-   `concat` adds a sequence to the end of another
-   `interleave`  riffles two sequences together
-   `interpose`  inserts a value inbetween each item in a sequence

strings are sequences!

randomize a sequence with `shuffle`


<a id="org32fb4a3"></a>

## Subsequences

    (drop 3 (range 10))
    (take 3 (range 10))

    (take-last 3 (range 10))
    (drop-last 3 (range 10))
    (take-while pos? [3 2 1 0 -1 -2 10])

take-while works like take but yous supply your in function on what gets taken or not

    (split-at 4 (range 10))
    (split-with number? [1 2 3 :mark 4 5 6 :mark 7])


<a id="org06f1168"></a>

## Collapsing sequences

You often times want to derive a smaller value out of the sequence that you&rsquo;re working with. You can do this wil a few differenct functions

    (frequencies [:meow :mrrrow :meow :meow])
    (:meow (frequencies [:meow :mrrrow :meow :meow]))

    (group-by :first [{:first "Li" :last "Zhou"} {:first "Sarah" :last "Lee"} {:first "Sarah" :last "Dunn"} {:first "Li" :last "O'Toole"}])


<a id="org2dd7399"></a>

## Collapse a Sequence with reduce

> user=> (doc reduce)
> 
> ---
> 
> ([f coll] [f val coll])
> f should be a function of 2 arguments. If val is not supplied, returns the result of applying f to the first 2 items in coll, then applying f to that result and the 3rd item, etc. If coll contains no items, f must accept no arguments as well, and reduce returns the result of calling f with no arguments. If coll has only 1 item, it is returned and f is not called. If val is supplied, returns the result of applying f to val and the first item in coll, then applying f to that result and the 2nd item, etc. If coll contains no items, returns val and f is not called.

function f combines successive elements of a sequence. (f state element) will return the state for the next invocation of f

f moves along the sequence and carries changing state with it

The final state is the return value of reduce

    (reduce + [1 2 3 4])
    (reductions + [1 2 3 4])
    ; 1 + 2 + 3 + 4
    ; 3 + 3 + 4
    ; 6 + 4
    ; 10

reduce sticks a function between each pair of elements.

-   **`reductions`:** returns a sequence of all the intermediate states

-   **into:** reduces elements into a collection

    (into {} [[:a 2] [:b 3]])


<a id="org1a57298"></a>

## Putting it together

Find the sum of the products of consecutive pairs of the first 1000 odd integers

    
    
    (reduce
     +
     (take 1000
           (map (fn [pair] (* (first pair) (second pair)))
                (partition 2 1
                           (filter odd?
                                   (iterate inc 0))))))

    (->> 0
     (iterate inc)
     (filter odd?)
     (partition 2 1)
     (map (fn [pair] (* (first pair) (second pair))))
     (take 100)
     (reduce +)
    )

