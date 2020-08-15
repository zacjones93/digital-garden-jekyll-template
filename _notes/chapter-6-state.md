---
title: Chapter 6 - State
---


# Table of Contents

1.  [Chapter 6: State](#org6cb88a7){: .internal-link}
    1.  [Immutability](#org8f3b30d){: .internal-link}
    2.  [Delays](#orgc71d8ac){: .internal-link}
    3.  [Futures](#org2069281){: .internal-link}
    4.  [Promises](#org136470b){: .internal-link}
    5.  [Vars](#org36f8297){: .internal-link}
    6.  [Atoms](#org4b3900e){: .internal-link}
    7.  [Refs](#orgee73b0c){: .internal-link}


<a id="org6cb88a7"></a>

# Chapter 6: State

Identity is a skein we lay across the world of immutable facts; a single entity which encompasses change. In programming, `identities unify different values over time.` Identity types are mutable references to immutable values.


<a id="org8f3b30d"></a>

## Immutability

The `let` keyword assigns immutable values
Immutability also extends to let bindings, function arguments, and other symbols. Functions remember the values of those symbols at the time the function was constructed.

    (defn present
      [gift] (fn [] gift))
    
    (def green-box (present "clockwork beetle"))
    (def red-box (present "plush tiger"))
    
    (red-box)

The inner function doesn&rsquo;t actually have any arguments in it. It can use gift because it&rsquo;s a clojure.

New functions close over all variables except their arguments. The arguments of the new function are provided when it&rsquo;s invoked.


<a id="orgc71d8ac"></a>

## Delays

Clojures allow you to delay the invocations of the inner function

    (def later (fn [] (prn "Adding") (+ 1 2)))
    
    (later)

This pattern is so common there&rsquo;s a macro for it&rsquo;s

    (def later (delay (prn "Adding") (+ 1 2)))
    
    later
    (deref later)

Instead of a function, delay creates a special type of Delay object: an identity which refers to expressions which should be evaluated later. We extract, or dereference, the value of that identity with deref.

Delays follow the same rules as functions, closing over lexical scopebecause delay actually macroexpands into an anonymous function.

Delays only evaluate their expressions once

-   **@ wormhole operator:** the operator that dereferences a delay object


<a id="org2069281"></a>

## Futures

opportunistac defer computation..

a delay which is evaluated in parallel

Both parallel and non-parallel evaluation of threads are concurrent because expressions from different threads can be evaluated out of order.

    (def x (future (prn "hi") (+ 1 2)))
    
    (deref x)
    @x

Their are techniques to control concurrent execution so that things happen in some well-defined sequence, like agents and locks.

You can use futures to do CPUintensive computation faster, to wait for multiple network requests to complete at once, or to run housekeeping code periodically.


<a id="org136470b"></a>

## Promises

Delays defer evaluation, and futures parallelize it.

What if we wanted to defer something we don’t even have yet?

To hand someone an empty box and, later, before they open it, sneak in and replacing its contents with an actual gift?

    (def box (promise))
    (deliver box :live-scorpions!)
    @box

Once delivered, a promise always refers to the same value.

A concurrency primitive: it guarantees that any attempt to read the value will wait until the value has been written.

    (def card (promise))
    
    (def dealer (future
                  (Thread/sleep 3000)
                  (deliver card [(inc (rand-int 13))
                                 (rand-nth [:clubs :spades :hearts :diamonds])])))
    
    @card

promises are concurrent without specifying how the evaluation occurs.

We control exactly when and how the value is delivered. You can think of both delays and futures as being built atop promises, in a way.


<a id="org36f8297"></a>

## Vars

The real world needs to refer to a single value (that changes) in specific points in time.

When a var is evaluated, it is replaced by its present value transparently–everywhere in the program.

    (def x :mouse)
    (def box (fn [] x))
    (box)
    (def x :cat)
    (box)

A reference which is the same everywhere is called a global variable, or simply a global.

-   **dynamic var:** we can override their value only within the scope of a particular function call, and nowhere else.

    (def ^:dynamic *board* :maple)
    (defn cut [] (prn "sawing through" *board*))
    (cut)
    (binding [*board* :cedar] (cut))
    (cut)

By convention, dynamic variables are named with asterisks around them


<a id="org4b3900e"></a>

## Atoms

A lot of programming languages are imperative and let you mutate on the fly. This read-modify-update process assumed that all updates would be consecutive–not concurrent.

Unlike vars, atoms are not transparent.

They are an identity that are dereferencable

Like vars, atoms can be set to a particular value–but instead of def , we use reset!

Unlike vars, atoms can be safely updated using swap!

swap! is a pure function. Clojure does some tricks under the hood so that updates are linearizable

1.  All updates with \`swap! complete in what appears to be a single consecutive order
2.  The effect of a swap! never takes place before calling swap!
3.  The effect of a swap! is visible to everyone once swap! returns.

    (def x (atom 0))
    (swap! x inc)
    (swap! x inc)
    
    (def xs (atom #{}))
    (dotimes [i 10] (future (swap! xs conj i)))
    @xs

Atoms are the workhorse of Clojure state. They’re lightweight, safe, fast, and flexible. You can use atoms with any immutable datatype–for instance, a map to track complex state. `Reach for an atom whenever you want to update a single thing over time.`


<a id="orgee73b0c"></a>

## Refs

Atoms are good for linearizable state individually. They aren&rsquo;t great in respect to other atoms.

Updating multiple atoms at once could have you running into the same issues

-   **serializability:** a global order. Ref

ref is an identity that is dereferencable

    (def x (ref 0))
    (def y (ref 0))
    (dosync
     (ref-set x 1)
     (ref-set y 2))
    [@x @y]
    
    (dosync
     (alter x + 2)
     (alter y inc))
    
    [@x @y]
    
    (dosync
     (commute x + 2)
     (commute y inc))
    
    [@x @y]

all alter operations within a dosync take place atomically - their effects are never interleaved with other transactions

commute can offer performance boosts if the operations are ok to do out of order. (commutative property in math)

    (def x (ref 0))
    (def y (ref 3))
    
    (dosync
     (alter x + (ensure y)))

Finally, if you want to read a value from one ref and use it to update another, use ensure instead of deref to perform a strongly consistent read–one which is guaranteed to take place in the same logical order as the dosync transaction itself.

Refs are typically an order of magnitude slower to update than atoms because of the added security

if there&rsquo;s no overlap between updates of state, use atoms

If all operations update the same identities, use a single atom to hold a map of the system’s state. If a system requires complex interlocking state spread throughput the program–that’s when to reach for refs.


