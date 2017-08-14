module Model exposing (Model, initialModel)

import Data.Budget exposing (Budget)
import Data.User exposing (User)
import Material


type alias Model =
    { counter : Int
    , user : Maybe User
    , budget : Maybe Budget
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    Model 0 Nothing Nothing Material.model
