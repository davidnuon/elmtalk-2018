module SlidesHelpers exposing (..)

import Markdown
import Html.Attributes exposing (class)

markdownSlide slide model =
    Markdown.toHtml [ class "slide" ] slide