module Data.ExpectedItem exposing (..)

import Date exposing (Date)
import Data.ItemType exposing (ItemType)
import Data.Period exposing (Period)


type alias ExpectedItem =
    { id : String
    , itemType : ItemType
    , name : String
    , period : Period
    , value : Float
    , dueDate : Date
    , archived : Bool
    , created : Date
    , updated : Date
    }
