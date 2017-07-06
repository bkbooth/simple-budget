module Data.ActualItem exposing (..)

import Date exposing (Date)
import Data.ExpectedItem exposing (ExpectedItem)


type alias ActualItem =
    { id : String
    , expectedItem : Maybe ExpectedItem
    , value : Float
    , valueDate : Date
    , comment : String
    , created : Date
    , modified : Date
    }
