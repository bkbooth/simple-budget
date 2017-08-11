module Update exposing (..)

import Material
import Model exposing (Model)


type Msg
    = Increment
    | Decrement
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }
            , Cmd.none
            )

        Decrement ->
            ( { model | counter = model.counter - 1 }
            , Cmd.none
            )

        Mdl message_ ->
            Material.update Mdl message_ model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
