module View exposing (rootView)

import Html exposing (Html, br, button, div, text)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Update exposing (Msg(..))


rootView : Model -> Html Msg
rootView model =
    div []
        [ text ("Counter: " ++ toString model.counter)
        , br [] []
        , button [ onClick Increment ] [ text "Increment" ]
        , button [ onClick Decrement ] [ text "Decrement" ]
        ]
