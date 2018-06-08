module Slides exposing (..)
import Array exposing (Array)

slides : Array (String)
slides = Array.fromList
    [
    """
# Intro to Elm

## Or, functional programming &hearts; frontend
    """,
    """
# Why elm?

## Elm is a functional language that compiles to Javascript.

It provides a reactive rendering model that makes it much easier to reason about your code.

    """,
    """
<pre>
// Imperitive Javascript
var newFruits = [];
var fruits = ["banana", "apple", "list"];
for (var i = 1; fruits.length; i++) {
   newFruits.push( "I am the" + fruits[i]); 
}

// Functional Javascript
["banana", "apple", "list"]
   .map ( (e) => "I am the ")

-- Elm 
List.map (\\e -> "I am the " ++ e) ["banana", "apple", "list"]

-- Also elm 
List.map ((++) "I am the ") ["banana", "apple", "list"]
</pre>
    """,
    """
## Usability and simplicity are one 
## of the main design goals of Elm.
    """,
    """
# What does elm look like?

<pre>
import Html exposing (..)

main : Html msg
main = text Hello World
</pre>
    """,
    """
<pre>
import Html exposing (..)

main : Html msg
main = 
   let 
     formatListitem x = text ("I am number " ++ x)
     listItems = List.map formatListitem (List.map toString [1,2,3,4,5])
   in
     ul [] 
</pre>
    """,
    """
<pre>
import Html exposing (..)

main : Html msg
main = 
   let 
     formatListitem x = "I am number " ++ x |> text
     listItems = [1,2,3,4,5] 
        |> List.map toString 
        |> List.map formatListitem
   in
     ul [] 
</pre>
    """,
    """
# An example app
    """,
    """
# You've seen this before
    """,
    """
# Tooling
    """,
    """
# Demo
    """
    ]
