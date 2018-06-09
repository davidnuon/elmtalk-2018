module Main exposing (..)

import Html exposing (Html, button, div, text, program, Attribute)
import Html.Events exposing (on, onClick, keyCode, onInput)
import Html.Attributes exposing (class)
import Array
import Json.Decode as Json
import Keyboard
import Slides exposing (slides)
import Markdown


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- MESSAGES


type Msg
    = Increment
    | Decrement
    | KeyMsg Keyboard.KeyCode



-- VIEW


view : Model -> Html Msg
view model =
    let
        slide =
            slides |> Array.get model

        slideContent =
            case slide of
                Nothing ->
                    (\_ -> text "")

                Just slide ->
                    slide
    in
        div [] [ slideContent model ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    let
        nextSlide =
            ( (model + 1) % Array.length slides, Cmd.none )

        prevSlide =
            ( max 0 (model - 1), Cmd.none )
    in
        case msg of
            KeyMsg key ->
                if key == 39 then
                    -- right arrow
                    nextSlide
                else if key == 37 then
                    -- left arrow
                    prevSlide
                else
                    ( model, Cmd.none )

            Increment ->
                nextSlide

            Decrement ->
                prevSlide


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs KeyMsg ]


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
