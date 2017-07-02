module ExpectedItem exposing (..)

import Date exposing (Date)
import ItemType exposing (ItemType)
import Period exposing (Period)


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
