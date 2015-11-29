module Distribute (horizontal, vertical, horizontalAlong, verticalAlong, radial, radialRotate) where

{-| Distribute forms evenly within their bounding box, along a line, or on a
circle.

Function names are chosen with the expectation that this module will imported
qualified, e.g. `Distribute.top`.

# Linear
@docs horizontal, vertical, horizontalAlong, verticalAlong

# Radial
@docs radial, radialRotate
-}

import List exposing (map, map2, indexedMap, length)
import Graphics.Collage exposing (Form, rotate)

minimum = List.minimum >> (\(Just x) -> x)
maximum = List.maximum >> (\(Just x) -> x)

{-| Distribute forms with even horizontal spacing within the bounding box of
their centers. -}
horizontal : List Form -> List Form
horizontal frms =
    let n = length frms
    in if n < 2 then frms else
        let left  = minimum <| map .x frms
            right = maximum <| map .x frms
            dx = (right - left) / toFloat (n-1)
            zipped = map2 (,) frms [0..n-1]
        in map (\(frm, t) -> {frm|x = left + dx * toFloat t}) zipped

{-| Distribute forms with even vertical spacing within the bounding box of their
centers. -}
vertical : List Form -> List Form
vertical frms =
    let n = length frms
    in if n < 2 then frms else
        let bot = minimum <| map .y frms
            top = maximum <| map .y frms
            dy = (top - bot) / toFloat (n-1)
        in indexedMap (\i frm -> {frm|y = bot + dy * toFloat i}) frms

{-| Distribute forms with even horizontal spacing along the given length. -}
horizontalAlong : Float -> List Form -> List Form
horizontalAlong len frms =
    let n = length frms
        halfL = len / 2
        dx = len / toFloat (n-1)
    in if n < 2 then frms else
       indexedMap (\i frm -> {frm|x = dx * toFloat i - halfL}) frms

{-| Distribute forms with even vertical spacing along the given height. -}
verticalAlong : Float -> List Form -> List Form
verticalAlong len frms =
    let n = length frms
        halfL = len / 2
        dy = len / toFloat (n-1)
    in if n < 2 then frms else
        indexedMap (\i frm -> {frm|y = dy * toFloat i - halfL}) frms

{-| Distribute forms with even angular spacing around a centerpoint at a given
radius. -}
radial : (Float, Float) -> Float -> List Form -> List Form
radial (x,y) r frms =
    let dtheta = turns (1 / toFloat (length frms))
        rot i frm =
            let t = toFloat i*dtheta
            in {frm|x = x + r * cos t,
                    y = y + r * sin t}
    in indexedMap rot frms

{-| Distribute forms with even angular spacing around a centerpoint at a given
radius, and rotate them. -}
radialRotate : (Float, Float) -> Float -> List Form -> List Form
radialRotate (x,y) r frms =
    let dtheta = turns (1 / toFloat (length frms))
        rot i frm =
            let t = toFloat i*dtheta
            in {frm|x = x + r * cos t,
                    y = y + r * sin t}
                   |> rotate t
    in indexedMap rot frms

