module View exposing (rootView)

import Html exposing (Html)
import Html.Attributes as Attributes
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Button as Button


rootView : Model -> Html Msg
rootView model =
    Html.div [ Attributes.id "app-root", Attributes.class "w-100 min-vh-100 bg-light-gray dark-gray f5 sans-serif" ]
        [ header model
        , mainView model
        , footer model
        ]


mainView : Model -> Html Msg
mainView model =
    Html.section [ Attributes.id "app-main", Attributes.class "mw8 ph3 p-header p-footer center" ]
        [ Html.h3 [ Attributes.class "f3 mb2" ] [ Html.text "Income" ]
        , Html.div [ Attributes.class "bg-white br2 shadow-1 overflow-hidden" ]
            [ Html.table [ Attributes.class "w-100 collapse" ]
                [ Html.thead []
                    [ Html.tr [ Attributes.class "bg-dark-pink near-white" ]
                        [ Html.th [ Attributes.class "pa2 bb b--dark-gray tl" ] [ Html.text "Item" ]
                        , Html.th [ Attributes.class "pa2 bb b--dark-gray tl w-20" ] [ Html.text "Period" ]
                        , Html.th [ Attributes.class "pa2 bb b--dark-gray tr w-20" ] [ Html.text "Amount" ]
                        ]
                    ]
                , Html.tbody []
                    [ Html.tr [ Attributes.class "striped--near-white" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "Salary" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Fortnight" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$3,400.00" ]
                        ]
                    , Html.tr [ Attributes.class "striped--near-white" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "Others" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Week" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$250.00" ]
                        ]
                    , Html.tr [ Attributes.class "striped--near-white b" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "TOTAL" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Fortnight" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$3,900.00" ]
                        ]
                    ]
                ]
            ]
        , Html.h3 [ Attributes.class "f3 mb2" ] [ Html.text "Bills" ]
        , Html.div [ Attributes.class "bg-white br2 shadow-1 overflow-hidden" ]
            [ Html.table [ Attributes.class "w-100 collapse" ]
                [ Html.thead []
                    [ Html.tr [ Attributes.class "bg-dark-pink near-white" ]
                        [ Html.th [ Attributes.class "pa2 bb b--dark-gray tl" ] [ Html.text "Item" ]
                        , Html.th [ Attributes.class "pa2 bb b--dark-gray tl w-20" ] [ Html.text "Period" ]
                        , Html.th [ Attributes.class "pa2 bb b--dark-gray tr w-20" ] [ Html.text "Amount" ]
                        ]
                    ]
                , Html.tbody []
                    [ Html.tr [ Attributes.class "striped--near-white" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "Rent" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Fortnight" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$320.00" ]
                        ]
                    , Html.tr [ Attributes.class "striped--near-white" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "Mobile Phones" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Month" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$290.00" ]
                        ]
                    , Html.tr [ Attributes.class "striped--near-white" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "Internet" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Month" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$99.99" ]
                        ]
                    , Html.tr [ Attributes.class "striped--near-white b" ]
                        [ Html.td [ Attributes.class "pa2" ] [ Html.text "TOTAL" ]
                        , Html.td [ Attributes.class "pa2" ] [ Html.text "Fortnight" ]
                        , Html.td [ Attributes.class "pa2 tr" ] [ Html.text "$500.00" ]
                        ]
                    ]
                ]
            ]
        ]


header : Model -> Html Msg
header model =
    Html.header [ Attributes.class "bg-blue fixed w-100 f4 pv3 ph3 ph5-l shadow-2" ]
        [ Html.a [ Attributes.href "/", Attributes.class "dib fw6 near-white no-underline dim" ]
            [ Html.text "Simple Budget" ]
        ]


footer : Model -> Html Msg
footer model =
    Html.footer [ Attributes.class "bg-dark-gray moon-gray f6 fixed bottom-0 w-100 pv4 ph3 ph5-l shadow-2" ]
        [ Html.text "© 2017 Ben Booth" ]
