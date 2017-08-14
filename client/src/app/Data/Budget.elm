module Data.Budget exposing (Budget, decoder)

import Data.ActualItem as ActualItem exposing (ActualItem)
import Data.ExpectedItem as ExpectedItem exposing (ExpectedItem)
import Data.Period as Period exposing (Period)
import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra
import Json.Decode.Pipeline as Pipeline


type alias Budget =
    { id : String
    , name : String
    , period : Period
    , expectedItems : List ExpectedItem
    , actualItems : List ActualItem
    , archived : Bool
    , created : Date
    , modified : Date
    }


decoder : Decoder Budget
decoder =
    Pipeline.decode Budget
        |> Pipeline.required "id" Decode.string
        |> Pipeline.required "name" Decode.string
        |> Pipeline.required "period" Period.decoder
        |> Pipeline.optional "expectedItems" (Decode.list ExpectedItem.decoder) []
        |> Pipeline.optional "actualItems" (Decode.list ActualItem.decoder) []
        |> Pipeline.optional "archived" Decode.bool False
        |> Pipeline.required "created" Json.Decode.Extra.date
        |> Pipeline.required "modified" Json.Decode.Extra.date
