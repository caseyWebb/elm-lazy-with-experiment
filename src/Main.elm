module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events as Events



-- import Html.Lazy as Lazy


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { value : Int
    }


init : Model
init =
    { value = 42
    }


type Msg
    = NoOp


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Html Msg
view model =
    div []
        [ button [ Events.onClick NoOp ] [ text "Trigger Update" ]

        -- , viewLazy model
        -- , viewLazyBroken { value = model.value }
        , viewLazyWith { value = model.value }
        ]



-- viewLazy : { value : Int } -> Html Msg
-- viewLazy =
--     Lazy.lazy (log "viewLazy" >> .value >> String.fromInt >> text)
-- viewLazyBroken : { value : Int } -> Html Msg
-- viewLazyBroken =
--     Lazy.lazy (log "viewLazyBroken" >> .value >> String.fromInt >> text)


viewLazyWith : { value : Int } -> Html Msg
viewLazyWith =
    lazyWith (\a b -> a.value == b.value) (log "viewLazyWith" >> .value >> String.fromInt >> text)


lazyWith : (a -> a -> Bool) -> (a -> Html msg) -> a -> Html msg
lazyWith _ _ _ =
    placeholder


placeholder : Html msg
placeholder =
    text "Missing lazyWith post-processing"



-- log =
--     Debug.log


log _ =
    identity
