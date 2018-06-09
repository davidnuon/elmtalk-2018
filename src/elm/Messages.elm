module Messages exposing (..)

import Keyboard

type Msg
    = Increment
    | Decrement
    | KeyMsg Keyboard.KeyCode
