module Views.Button exposing (default)

import Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events


button : String -> String -> Maybe String -> String -> msg -> Html msg
button bg color extraClasses label clickAction =
    Html.button
        [ Events.onClick clickAction
        , String.join " " [ "dib", "pointer", "darken", "bn", "br2", "pa2", bg, color, (Maybe.withDefault "" extraClasses) ]
            |> Attributes.class
        ]
        [ Html.text label ]


default : String -> msg -> Maybe String -> Html msg
default label clickAction extraClasses =
    button "bg-dark-pink" "near-white" extraClasses label clickAction
