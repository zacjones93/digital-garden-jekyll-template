---
title: Chapter 2 - Basic Types
---


# Table of Contents

1.  [Chapter 2: Basic Types](#org96f8b85){: .internal-link}
    1.  [Resources](#org23891a4){: .internal-link}
    2.  [Types](#org851c1cf){: .internal-link}
    3.  [Integers](#orgb39933b){: .internal-link}
    4.  [Fractional numbers](#orgbcef261){: .internal-link}
    5.  [Mathematical operations](#org97d4aa2){: .internal-link}
    6.  [Strings](#org03eb648){: .internal-link}
    7.  [Booleans and logic](#orge2626b1){: .internal-link}
    8.  [Symbols](#org6625862){: .internal-link}
    9.  [Keywords](#orgf7a9140){: .internal-link}
    10. [Lists](#orgbb93efd){: .internal-link}
    11. [Vectors](#org5f13d97){: .internal-link}
    12. [Sets](#orged829b2){: .internal-link}
    13. [Maps](#orged1cfbe){: .internal-link}


<a id="org96f8b85"></a>

# Chapter 2: Basic Types


<a id="org23891a4"></a>

## Resources

-   [signed two&rsquo;s complement representation](https://en.wikipedia.org/wiki/Two's_complement)
-   [Introducing regular expressions](https://www.oreilly.com/library/view/introducing-regular-expressions/9781449338879/)


<a id="org851c1cf"></a>

## Types

-   **Type:** a group of values which work in the same way. A Property that some values share, which allows us to organize the world into sets of similar things.
-   types can overlap and intersect each other
-   Types completely subsume one another
-   Every language has a type system. Some languages strict, other&rsquo;s more lax.
-   Clojure has strong types because operations on improper types will not allowed. It&rsquo;s dynamic because types are enforced when the program is run instead of when it&rsquo;s first read by the computer


<a id="orgb39933b"></a>

## Integers

-   Long intergers
    longs use one bit to store the sign (negative or positive)
    the other 63 bits represent the size of the number
    Which means&#x2026; 9223372036854775807 is the longest number that&rsquo;s represented


<a id="orgbcef261"></a>

## Fractional numbers

floats and doubles are approximations
the ratio type is how to be exact with these numbers.

    (0.99999999999999999)
    ;;-> 1.0
    (type 1/3)
    ;;-> clojure.lang.Ratio


<a id="org97d4aa2"></a>

## Mathematical operations

    (= 3 3.0)
    ;;-> false
    (== 3 3.0)
    ;;-> true

The operation comes first but you can subtract, multiple and divide numbers how you would expect.

    (- 3 1)
    ;;-> 2


<a id="org03eb648"></a>

## Strings

-   You can make almost anything into a string with `str`
-   you can combine things into a string with `str`
-   \#&ldquo;&#x2026;&rdquo; is clojures way of writing regular expressions
-   re-find and re-matches find occurances of regex in a string


<a id="orge2626b1"></a>

## Booleans and logic

-   true is positive
-   false and nil are negative
-   we can reasion about true with and, or, not
-   Boolean logic is important for control flow


<a id="org6625862"></a>

## Symbols

-   the job of symbols is to refer to things, to point to other values
-   when evaluated, symbols are replaced by corresponding values.


<a id="orgf7a9140"></a>

## Keywords

-   Keywords are like strings but they are specifically intended for use as labels or identifiers.
-   prepend with :
    
        (type :cat)
        ;;-> clojure.lang.Keyword
-   useful when paired with other values in a collection e.g. a map


<a id="orgbb93efd"></a>

## Lists

-   ordered collection
-   Lists are a collection - a group of values
-   quote lists with &rsquo; to prevent from being evaluated
-   A collection is a container which provides some structure for the thing it holds - which are called elements or members


<a id="org5f13d97"></a>

## Vectors

-   Vectors are not evaluated like lists
-   first, second, and nth work for acessing vectors
-   rest and next return &rsquo;everything but the first element&rsquo; in a vector
    
        (rest [1 2 3])
        ;;-> (2 3)
-   Vectors have index&rsquo;s
-   Vectors are intended for looking up elements by index
    
        ([:a :b :c] 1)
        ;;-> :b


<a id="orged829b2"></a>

## Sets

-   unordered collection
-   \#{&#x2026;} defines a set.
-   order doesn&rsquo;t matter in a set, if you want order - use a vector
-   sets contain unique values
-   most common opperation is checking if something is inside a set with contains?
-   You can make a set out of any other collection with `set`


<a id="orged1cfbe"></a>

## Maps

-   a data structure which associates keys with values
-   maps are surrounded by braces {&#x2026;}
-   maps can be used as verbs
-   keywords look themselves up in a map


