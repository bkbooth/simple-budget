module Data.Period exposing (Period(..), decoder)

import Json.Decode as Decode exposing (Decoder)


type Period
    = Week
    | Fortnight
    | Month
    | Quarter
    | Year


decoder : Decoder Period
decoder =
    Decode.string |> Decode.andThen labelToPeriodDecoder


labelToPeriodDecoder : String -> Decoder Period
labelToPeriodDecoder periodLabel =
    case periodLabel of
        "Week" ->
            Decode.succeed Week

        "Fortnight" ->
            Decode.succeed Fortnight

        "Month" ->
            Decode.succeed Month

        "Quarter" ->
            Decode.succeed Quarter

        "Year" ->
            Decode.succeed Year

        unknownPeriodLabel ->
            Decode.fail ("Unknown period: " ++ unknownPeriodLabel)
