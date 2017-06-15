module App exposing (main)

import Html exposing (Html, br, button, div, text)
import Html.Attributes exposing (id, type_)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = Model 0
        , update = update
        , view = view
        }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }


view : Model -> Html Msg
view model =
    div [ id "app-root" ]
        [ text ("Counter: " ++ toString model.counter)
        , br [] []
        , button [ onClick Increment ] [ text "Increment" ]
        , button [ onClick Decrement ] [ text "Decrement" ]
        ]


type alias Model =
    { counter : Int
    }


type Msg
    = Increment
    | Decrement
