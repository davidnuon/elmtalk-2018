module Main exposing (..)

import Html exposing (Html, button, div, text, program, Attribute)
import Html.Events exposing (on, onClick, keyCode, onInput)
import Html.Attributes exposing (class)
import Array
import Json.Decode as Json
import Keyboard
import Slides exposing (slides)
import Markdown
import Messages exposing (..)
import Mouse


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


type alias Model =
    {
        currentSlide : Int,
        counter: Int,
        mouseX: Int, 
        mouseY: Int
    }

initState = { currentSlide = 0, counter = 0, mouseX = 0, mouseY = 0 }

init : ( Model, Cmd Msg )
init =
    ( initState, Cmd.none )

-- VIEW


view : Model -> Html Msg
view model =
    let
        slide =
            slides |> Array.get model.currentSlide

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
            { model | currentSlide = (model.currentSlide + 1) % Array.length slides }

        prevSlide =
            { model | currentSlide = max 0 (model.currentSlide - 1) }
    in
        case msg of
            KeyMsg key ->
                if key == 39 then
                    -- right arrow
                    ( nextSlide, Cmd.none )
                else if key == 37 then
                    -- left arrow
                    ( prevSlide, Cmd.none )
                else
                    ( model, Cmd.none )

            Increment ->
                ( { model | counter = model.counter + 1 }, Cmd.none )

            Decrement ->
                ( { model | counter = model.counter - 1 }, Cmd.none )
                
            MouseMovement x y-> 
                ( { model | mouseX = x, mouseY = y }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ 
            Keyboard.downs KeyMsg,
            Mouse.moves (\{x, y} -> MouseMovement x y)
        ]


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
