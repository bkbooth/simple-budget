module Model exposing (..)

import User exposing (User)
import Budget exposing (Budget)


type alias Model =
    { counter : Int
    , user : Maybe User
    , budget : Maybe Budget
    }


initialModel : Model
initialModel =
    Model 0 Nothing Nothing
