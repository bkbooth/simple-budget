module Model exposing (..)

import Material
import Data.User exposing (User)
import Data.Budget exposing (Budget)


type alias Model =
    { counter : Int
    , user : Maybe User
    , budget : Maybe Budget
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    Model 0 Nothing Nothing Material.model
