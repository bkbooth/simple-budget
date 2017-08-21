module View exposing (rootView)

import Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events
import Model exposing (Model)
import Update exposing (Msg(..))


rootView : Model -> Html Msg
rootView model =
    Html.div [ Attributes.id "app-root", Attributes.class "w-100 min-vh-100 bg-light-gray f4 sans-serif" ]
        [ header model
        , mainView model
        , footer model
        ]


mainView : Model -> Html Msg
mainView model =
    Html.section [ Attributes.id "app-main", Attributes.class "mw8 ph3 p-header p-footer center" ]
        [ Html.p [] [ Html.text ("Counter: " ++ toString model.counter) ]
        , Html.p []
            [ Html.button
                [ Events.onClick Increment, Attributes.class "dib mr2" ]
                [ Html.text "Increment" ]
            , Html.button
                [ Events.onClick Decrement, Attributes.class "dib" ]
                [ Html.text "Decrement" ]
            ]
        ]


header : Model -> Html Msg
header model =
    Html.header [ Attributes.class "bg-brand-primary fixed w-100 pv3 ph3 ph5-l shadow-2" ]
        [ Html.a [ Attributes.href "/", Attributes.class "dib fw6 near-white no-underline dim ttu tracked" ]
            [ Html.text "Simple Budget" ]
        ]


footer : Model -> Html Msg
footer model =
    Html.footer [ Attributes.class "bg-dark-gray moon-gray f5 fixed bottom-0 w-100 pv4 ph3 ph5-l shadow-2" ]
        [ Html.text "© 2017 Ben Booth" ]
