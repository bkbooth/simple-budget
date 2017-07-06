module Model exposing (..)

import Data.User exposing (User)
import Data.Budget exposing (Budget)


type alias Model =
    { counter : Int
    , user : Maybe User
    , budget : Maybe Budget
    }


initialModel : Model
initialModel =
    Model 0 Nothing Nothing
