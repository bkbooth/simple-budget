module App exposing (main)

import Html exposing (Html)
import Model exposing (Model, initialModel)
import Update exposing (Msg, update)
import View exposing (rootView)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = rootView
        }
