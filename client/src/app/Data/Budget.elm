module Data.Budget exposing (..)

import Date exposing (Date)
import Data.User exposing (User)
import Data.ExpectedItem exposing (ExpectedItem)
import Data.ActualItem exposing (ActualItem)
import Data.Period exposing (Period)


type alias Budget =
    { id : String
    , name : String
    , owner : User
    , period : Period
    , expectedItems : List ExpectedItem
    , actualItems : List ActualItem
    , archived : Bool
    , created : Date
    , modified : Date
    }
