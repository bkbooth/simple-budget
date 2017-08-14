module Data.ItemType exposing (ItemType(..), decoder)

import Json.Decode as Decode exposing (Decoder)


type ItemType
    = Income
    | Bill
    | Saving
    | Donation


decoder : Decoder ItemType
decoder =
    Decode.string |> Decode.andThen labelToItemTypeDecoder


labelToItemTypeDecoder : String -> Decoder ItemType
labelToItemTypeDecoder itemTypeLabel =
    case itemTypeLabel of
        "Income" ->
            Decode.succeed Income

        "Bill" ->
            Decode.succeed Bill

        "Saving" ->
            Decode.succeed Saving

        "Donation" ->
            Decode.succeed Donation

        unknownItemTypeLabel ->
            Decode.fail ("Unknown item type: " ++ unknownItemTypeLabel)
