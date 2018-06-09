module SlidesDemos exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Messages 
import Html.Events exposing (onClick)

demoSize html = 
    div [class "demo-size"] [html]

counterDemo model = 
    let
        buttonPadding = style [("margin", "20px")]
        exampleCode ="""-- Model
type alias Model = { counter: Int }

initModel = { counter = 0 }
init = ( initModel, Cmd.none )

-- Messages 
type Msg = Increment | Decrement

-- Update
update msg model =
    case msg of 
        Increment -> { model | counter = counter + 1 }
        Decrement -> { model | counter = counter - 1 }

-- Rendered View
view model = div [] [
    let
        textHTML = text <| toString <| model.counter
    in 
        span [class "big-counter] [textHTML],
            div [] [
                button [buttonPadding, 
                    onClick Increment] [text "increment"],
                button [buttonPadding, 
                    onClick Decrement] [text "decrement"]
            ]
]

-- For external data (e.g WebSockets, clock ticks)
subscriptions = Sub.none
main = {
    init = init , view = view ,
    update = update , subscriptions = subscriptions
}
        """
    in
        div [] [
            div [class "left"] [pre [] [text exampleCode]],
            div [class "right"] [
                span [class "big-counter"] [text <| toString <| model.counter],
                div [] [
                    button [buttonPadding, onClick Messages.Increment] [text "increment"],
                    button [buttonPadding, onClick Messages.Decrement] [text "decrement"]
                ]
            ]
        ] |> demoSize