module App exposing (main)

import Html exposing (Html)
import Model exposing (Model)
import Update exposing (Msg)
import View


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = Update.update
        , subscriptions = Update.subscriptions
        , view = View.rootView
        }


init : ( Model, Cmd Msg )
init =
    ( Model.initialModel
    , Cmd.none
    )
