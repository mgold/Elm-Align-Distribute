module Align (top, bottom, horizontal, left, right, vertical) where
{-| Align forms to the horizontal or vertical lines of their bounding box.

Function names are chosen with the expectation that this module will imported
qualified, e.g. `Align.top`.

# Horizontal
@docs top, bottom, horizontal

# Vertical
@docs left, right, vertical
-}

import List exposing (map)
import Graphics.Collage exposing (Form)

minimum = List.minimum >> (\(Just x) -> x)
maximum = List.maximum >> (\(Just x) -> x)

{-| Align forms with the uppermost form. -}
top : List Form -> List Form
top frms =
    if List.isEmpty frms then [] else
    let t = maximum <| map .y frms
    in map (\frm -> {frm | y <- t}) frms

{-| Align forms with the bottommost form. -}
bottom : List Form -> List Form
bottom frms =
    if List.isEmpty frms then [] else
    let bot = minimum <| map .y frms
    in map (\frm -> {frm | y <- bot}) frms

{-| Align forms with the leftmost form. -}
left : List Form -> List Form
left frms =
    if List.isEmpty frms then [] else
    let lft = minimum <| map .x frms
    in map (\frm -> {frm | x <- lft}) frms

{-| Align forms with the rightmost form. -}
right : List Form -> List Form
right frms =
    if List.isEmpty frms then [] else
    let rgt = maximum <| map .x frms
    in map (\frm -> {frm | x <- rgt}) frms

{-| Align forms horizontally, halfway between the uppermost and bottommost
 forms. -}
horizontal : List Form -> List Form
horizontal frms =
    if List.isEmpty frms then [] else
    let t = maximum <| map .y frms
        bot = minimum <| map .y frms
        mid = (t + bot) / 2
    in map (\frm -> {frm | y <- mid}) frms

{-| Align forms vertically, halfway between the leftmost and rightmost forms. -}
vertical : List Form -> List Form
vertical frms =
    if List.isEmpty frms then [] else
    let rgt = maximum <| map .x frms
        lft = minimum <| map .x frms
        mid = (rgt + lft) / 2
    in map (\frm -> {frm | x <- mid}) frms

