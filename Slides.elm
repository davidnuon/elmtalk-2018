module Slides exposing (..)

import Html exposing (Html, button, div, text, program, Attribute)

type alias Slides msg =
  { 
    children : List (Html.Html msg),
    classes: List (String)
  }

slides : List (Slides msg)
slides = [
    {
        children = [
            div [] [text "Slide 1"]
        ],
        classes = []
    },
    {
        children = [
            div [] [text "Slide 2"]
        ],
        classes = []
    },
    {
        children = [
            div [] [text "Slide 4"]
        ],
        classes = []
    },
    {
        children = [
            div [] [text "Slide 5"]
        ],
        classes = []
    },
    {
        children = [
            div [] [text "Slide 6"]
        ],
        classes = []
    },
    {
        children = [
            div [] [text "Slide 3"]
        ],
        classes = []
    }]
