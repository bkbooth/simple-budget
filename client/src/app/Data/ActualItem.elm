module Data.ActualItem exposing (ActualItem, decoder)

import Data.ExpectedItem as ExpectedItem exposing (ExpectedItem)
import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra
import Json.Decode.Pipeline as Pipeline


type alias ActualItem =
    { id : String
    , expectedItem : Maybe ExpectedItem
    , value : Float
    , valueDate : Date
    , comment : Maybe String
    , created : Date
    , modified : Date
    }


decoder : Decoder ActualItem
decoder =
    Pipeline.decode ActualItem
        |> Pipeline.required "id" Decode.string
        |> Pipeline.optional "expectedItem" (Decode.maybe ExpectedItem.decoder) Nothing
        |> Pipeline.required "value" Decode.float
        |> Pipeline.required "valueDate" Json.Decode.Extra.date
        |> Pipeline.optional "comment" (Decode.maybe Decode.string) Nothing
        |> Pipeline.required "created" Json.Decode.Extra.date
        |> Pipeline.required "modified" Json.Decode.Extra.date
