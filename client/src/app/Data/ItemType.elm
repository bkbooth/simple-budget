module Data.ItemType exposing (ItemType(..), decoder, fromString)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra


type ItemType
    = Income
    | Bill
    | Saving
    | Donation


decoder : Decoder ItemType
decoder =
    Decode.string
        |> Decode.andThen (Json.Decode.Extra.fromResult << fromString)


fromString : String -> Result String ItemType
fromString itemTypeLabel =
    case itemTypeLabel of
        "Income" ->
            Ok Income

        "Bill" ->
            Ok Bill

        "Saving" ->
            Ok Saving

        "Donation" ->
            Ok Donation

        unknownItemTypeLabel ->
            Err ("Unknown item type: " ++ unknownItemTypeLabel)
