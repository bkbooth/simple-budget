module View exposing (rootView)

import Html exposing (Html)
import Material.Button as Button
import Material.Footer as Footer
import Material.Grid as Grid
import Material.Layout as Layout
import Material.Options as Options
import Model exposing (Model)
import Update exposing (Msg(..))


rootView : Model -> Html Msg
rootView model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ header model ]
        , drawer = []
        , tabs = ( [], [] )
        , main =
            [ mainView model
            , footer model
            ]
        }


mainView : Model -> Html Msg
mainView model =
    Grid.grid []
        [ Grid.cell []
            [ Html.text ("Counter: " ++ toString model.counter)
            , Html.br [] []
            , Button.render Mdl
                [ 0 ]
                model.mdl
                [ Button.raised
                , Button.ripple
                , Button.colored
                , Options.onClick Increment
                ]
                [ Html.text "Increment" ]
            , Button.render Mdl
                [ 1 ]
                model.mdl
                [ Button.raised
                , Button.ripple
                , Button.colored
                , Options.onClick Decrement
                ]
                [ Html.text "Decrement" ]
            ]
        ]


header : Model -> Html Msg
header model =
    Layout.row
        []
        [ Layout.title [] [ Html.text "Simple Budget" ] ]


footer : Model -> Html Msg
footer model =
    Footer.mini []
        { left =
            Footer.left []
                [ Footer.logo [] [ Footer.html <| Html.text "© 2017 Ben Booth" ] ]
        , right = Nothing
        }
