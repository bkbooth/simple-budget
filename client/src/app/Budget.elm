module Budget exposing (..)

import Date exposing (Date)
import User exposing (User)
import ExpectedItem exposing (ExpectedItem)
import ActualItem exposing (ActualItem)
import Period exposing (Period)


type alias Budget =
    { id : String
    , name : String
    , owner : User
    , period : Period
    , expectedItems : List ExpectedItem
    , actualItems : List ActualItem
    , archived : Bool
    , created : Date
    , updated : Date
    }
