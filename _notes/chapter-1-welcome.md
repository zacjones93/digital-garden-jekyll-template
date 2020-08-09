---
title: Chapter 1 - Welcome
---

-   true, false, nil form the three poles of the Lisp logical system.
-   values - the nouns of programming
-   **symbols:** references to other values
    
    You can escape an expression by &rsquo;quoting&rsquo; it.
    
        'inc
        '123
        '"foo"
        '(1 2 3)

What you quote is what you will get returned. It delays interpretation of the expression

-   **LISP:** LISt Processing

-   Lists are core to clujure. They can contain anything (e.g. nil, strings, numbers etc.)
    
        '(1 (2 (3 ())))
    
    > Above is a nested list which you can think of as a tree.
    > Language is like a tree.. sentances are comprised of clauses, which can be nested, and each clause may have subjects modified by adjectives, and verbs modified by adverbs, and so on
    
    > A sentence in Lisp is a list. It starts with a verb, and is followed by zero or more objects for that verb to act on.

> The entire grammar of Lisp: the structure for every expression in the language. We transform expressions by substituting meanings for symbols, and obtain some result. This is the core of Lambda Calculus, and it is the theoretical basis for almost all computer languages.


