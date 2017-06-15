module Update exposing (..)

import Model exposing (Model)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }


type Msg
    = Increment
    | Decrement
