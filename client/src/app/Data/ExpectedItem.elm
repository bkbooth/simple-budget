module Data.ExpectedItem exposing (ExpectedItem, decoder)

import Data.ItemType as ItemType exposing (ItemType)
import Data.Period as Period exposing (Period)
import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra
import Json.Decode.Pipeline as Pipeline


type alias ExpectedItem =
    { id : String
    , itemType : ItemType
    , name : String
    , period : Period
    , value : Float
    , dueDate : Maybe Date
    , archived : Bool
    , created : Date
    , modified : Date
    }


decoder : Decoder ExpectedItem
decoder =
    Pipeline.decode ExpectedItem
        |> Pipeline.required "id" Decode.string
        |> Pipeline.required "itemType" ItemType.decoder
        |> Pipeline.required "name" Decode.string
        |> Pipeline.required "period" Period.decoder
        |> Pipeline.required "value" Decode.float
        |> Pipeline.required "dueDate" (Decode.nullable Json.Decode.Extra.date)
        |> Pipeline.optional "archived" Decode.bool False
        |> Pipeline.required "created" Json.Decode.Extra.date
        |> Pipeline.required "modified" Json.Decode.Extra.date
