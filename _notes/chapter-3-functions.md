---
title: Chapter 3 - Functions
---

# Table of Contents

1.  [Chapter 3: Functions](#orgbe96178)
    1.  [Resources](#org3241cd5)
    2.  [let bindings](#org211451a)
    3.  [Functions](#orge2b7169)
    4.  [Vars](#org0b77b70)
    5.  [Defining functions](#orgb6d2581)
    6.  [How does type work?](#org10e26b6)


<a id="orgbe96178"></a>

# Chapter 3: Functions

What are verbs?


<a id="org3241cd5"></a>

## Resources

-   [clojure cheatsheet](https://clojure.org/api/cheatsheet)


<a id="org211451a"></a>

## let bindings

-   let defines a meaning for a symbol within a specific expression
    
        (let [cats 5] (str "I have " cats " cats."))
        ;;->"I have 5 cats."
-   the bindings only apply within the let expression itself
-   clojure doesn&rsquo;t care about spacing, alignment, or newlines
-   later bindings can use previous bindings

    (let [cats 3 legs (* 4 cats)] (str legs " legs all together."))
    ;;-> "12 legs all together."


<a id="orge2b7169"></a>

## Functions

-   almost all verbs in Clojure are functions
-   functions represent unrealized computation - expressions that aren&rsquo;t evaluated yet.
    
        ((fn [x] (+ x 1)) 2)
        ;;-> 3

x is this functions argument or parameter

-   functions describe the relationship between arguments and return balues
-   there is shorthand for functions too..
    
        (#(+ % 1) 2)
        ;;->3
    
    same function as described above
-   functions are meant to delay evaluation. Isolate patterns of computation


<a id="org0b77b70"></a>

## Vars

-   def defines a varaible
-   variables are mutable

    user=> (def astronauts [])
    #'user/astronauts
    user=> (count astronauts)
    0
    user=> (def astronauts ["hey" "heyhey"])
    #'user/astronauts
    user=> (count astronauts)
    2
    user=>


<a id="orgb6d2581"></a>

## Defining functions

-   creating a function and binding it to a var has it&rsquo;s own shorthand `defn`

    user=> (def half (fn [number] (/ number 2)))
    #'user/half
    user=> (half 6)
    3
    user=> (defn half [number] (/ number 2))
    #'user/half

-   functions don&rsquo;t have to take arguments
-   arity in a function is how many arguments it takes
-   you can handle multiple &rsquo;arities&rsquo; of functions by defining alternate forms
    
        user=> (defn half
          #_=> ( [] 1/2)
          #_=> ([x] (/ x 2)))
        #'user/half
        user=> (half)
        1/2
        user=> (half 10)
        5
-   Some functions can take any number of args
    use the & when defining arguments and the rest of the args will be put into the last one
    
        user=> (defn vargs
          #_=> [x y & more-args]
          #_=> {:x x
          #_=>  :y y
          #_=>  :more more-args})
        #'user/vargs
        user=> (vargs 1)
        Execution error (ArityException) at user/eval2048 (REPL:1).
        Wrong number of args (1) passed to: user/vargs
        
        user=> (vargs 1 2)
        {:x 1, :y 2, :more nil}
        user=> (vargs 1 2 3 4 5 6)
        {:x 1, :y 2, :more (3 4 5 6)}
-   Functions take a docstring which you can add to a function
    
        user=> (defn half
          #_=> "halves a value"
          #_=> ( [] 1/2)
          #_=> ([x] (/ x 2)))
        #'user/half
        user=> (doc half)
        -------------------------
        user/half
        ([] [x])
          halves a value
        nil


<a id="org10e26b6"></a>

## How does type work?

    user=> (doc type)
    -------------------------
    clojure.core/type
    ([x])
      Returns the :type metadata of x, or its Class if none
    nil

-   almost every function in clojure is made up of simple functions
-   use `source` to view the source code of a function

