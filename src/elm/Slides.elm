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
// Imperative Javascript
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
<pre>
// React JSX
class ContainerCompontent extends Component { 
   function render () { return &lt;div&gt;{this.props.children}&lt;/div&gt;; }
}
&lt;ContainerCompontent&gt;
  &lt;p&gt;This is some text. I'm living inside a React component.&lt;/p&gt;
&lt;/ContainerComponent&gt;

// Realized ReactDOM
ReactDOM.render(
  React.createElement(ContainerCompontent, {}, 
     React.createElement('p', {}, 
     React.createElement(null, "This is some text. I'm living inside a React component."))),
  document.getElementById('root')
);
</pre>
    """,
    """
<pre>
-- Elm
container children = div [] children
main = 
   container [
       p [] [text "This is some text. I'm living inside an Elm functon."]
   ]
</pre>
    """,
    """
## Usability and simplicity are one 
## of the main design goals of Elm.
You get the power of a language like Haskell with the usability of React or Vue.
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
