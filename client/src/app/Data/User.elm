module Data.User exposing (User, decoder)

import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra
import Json.Decode.Pipeline as Pipeline


type alias User =
    { id : String
    , email : String
    , name : String
    , picture : String
    , created : Date
    , modified : Date
    }


decoder : Decoder User
decoder =
    Pipeline.decode User
        |> Pipeline.required "id" Decode.string
        |> Pipeline.required "email" Decode.string
        |> Pipeline.required "name" Decode.string
        |> Pipeline.required "picture" Decode.string
        |> Pipeline.required "created" Json.Decode.Extra.date
        |> Pipeline.required "modified" Json.Decode.Extra.date
