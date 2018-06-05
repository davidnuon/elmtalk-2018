module App exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)

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
            div [] [text "Slide 3"]
        ],
        classes = []
    }]

type alias Model = Int

init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )

-- MESSAGES
type Msg = Increment | Decrement

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ 
            button [ onClick Increment ] [ text "+"]
        ,   model |> toString  |> text 
        ,   button [ onClick Decrement ] [ text "-"]
        ]

-- UPDATE
update : Msg -> Model -> (Model, Cmd msg)
update msg model =
    case msg of
        Increment -> 
            ((model + 1) % List.length slides, Cmd.none)
        Decrement -> 
            (max 0 (model - 1), Cmd.none)

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }