module Data.Period exposing (Period(..), decoder, fromString)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra


type Period
    = Week
    | Fortnight
    | Month
    | Quarter
    | Year


decoder : Decoder Period
decoder =
    Decode.string
        |> Decode.andThen (Json.Decode.Extra.fromResult << fromString)


fromString : String -> Result String Period
fromString periodLabel =
    case periodLabel of
        "Week" ->
            Ok Week

        "Fortnight" ->
            Ok Fortnight

        "Month" ->
            Ok Month

        "Quarter" ->
            Ok Quarter

        "Year" ->
            Ok Year

        unknownPeriodLabel ->
            Err ("Unknown period: " ++ unknownPeriodLabel)
