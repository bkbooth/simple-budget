module Data.User exposing (..)

import Date exposing (Date)


type alias User =
    { id : String
    , email : String
    , name : String
    , picture : String
    , created : Date
    , updated : Date
    }
