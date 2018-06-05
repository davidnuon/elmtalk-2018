module Slides exposing (..)

import Html exposing (Html, button, div, text, program, Attribute)
import SlidesContent exposing (..)

type alias Slide =
  { 
    children : String,
    classes: List (String)
  }

emptySlide : Slide
emptySlide = 
    {
        children = "",
        classes = []
    }

markdownToSlide markdown = 
    {
        children = markdown,
        classes = []
    }

slides : List (Slide)
slides = List.map markdownToSlide slideMarkdown