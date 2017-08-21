module Model exposing (Model, initialModel)

import Data.Budget exposing (Budget)
import Data.User exposing (User)


type alias Model =
    { counter : Int
    , user : Maybe User
    , budget : Maybe Budget
    }


initialModel : Model
initialModel =
    Model 0 Nothing Nothing
