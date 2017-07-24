module View exposing (rootView)

import Html exposing (Html, br, button, div, footer, header, section, text)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Update exposing (Msg(..))


rootView : Model -> Html Msg
rootView model =
    div [ id "app-root" ]
        [ section [ id "main" ]
            [ text ("Counter: " ++ toString model.counter)
            , br [] []
            , button [ onClick Increment ] [ text "Increment" ]
            , button [ onClick Decrement ] [ text "Decrement" ]
            ]
        , header [] [ text "Simple Budget" ]
        , footer [] [ text "© 2017 Ben Booth" ]
        ]
