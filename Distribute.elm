module Distribute where

{-| Distribute forms evenly within their bounding box, along a line, or on a
circle.

Function names are chosen with the expectation that this module will imported
qualified, e.g. `Distribute.top`.

# Linear
@docs horizontal, vertical, horizontalAlong, verticalAlong

# Radial
@docs radial, radialRotate
-}

{-| Distribute forms with even horizontal spacing within the bounding box of
their centers. -}
horizontal : [Form] -> [Form]
horizontal frms = let n = length frms
             in if n < 2 then frms else let
                left  = minimum <| map .x frms
                right = maximum <| map .x frms
                dx = (right - left) / toFloat (n-1)
                zipped = zip frms [0..n-1]
             in map (\(frm, t) -> {frm|x <- left + dx * toFloat t}) zipped

{-| Distribute forms with even vertical spacing within the bounding box of their
centers. -}
vertical : [Form] -> [Form]
vertical frms = let n = length frms
                in if n < 2 then frms else let
                   bot = minimum <| map .y frms
                   top = maximum <| map .y frms
                   dy = (top - bot) / toFloat (n-1)
                   zipped = zip frms [0..n-1]
                in map (\(frm, t) -> {frm|y <- bot + dy * toFloat t}) zipped

{-| Distribute forms with even horizontal spacing along the given length. -}
horizontalAlong : Float -> [Form] -> [Form]
horizontalAlong len frms = let n = length frms
    in if n < 2 then frms else let
       halfL = len / 2
       dx = len / toFloat (n-1)
       zipped = zip frms [0..n-1]
    in map (\(frm, t) -> {frm|x <- dx * toFloat t - halfL}) zipped


{-| Distribute forms with even vertical spacing along the given height. -}
verticalAlong : Float -> [Form] -> [Form]
verticalAlong len frms = let n = length frms
    in if n < 2 then frms else let
       halfL = len / 2
       dy = len / toFloat (n-1)
       zipped = zip frms [0..n-1]
    in map (\(frm, t) -> {frm|y <- dy * toFloat t - halfL}) zipped


{-| Distribute forms with even angular spacing around a centerpoint at a given
radius. -}
radial : (Float, Float) -> Float -> [Form] -> [Form]
radial (x,y) r frms = case frms of
    [] -> []
    _ -> let n = length frms
             dtheta = turns (1 / toFloat n)
             zipped = zip frms (map ((\s -> s*dtheta) . toFloat) [0..n-1])
         in map (\(frm, t) -> {frm|x <- x + r * cos t,
                                   y <- y + r * sin t}) zipped

{-| Distribute forms with even angular spacing around a centerpoint at a given
radius, and rotate them. -}
radialRotate : (Float, Float) -> Float -> [Form] -> [Form]
radialRotate (x,y) r frms = case frms of
    [] -> []
    _ -> let n = length frms
             dtheta = turns (1 / toFloat n)
             zipped = zip frms (map ((\s -> s*dtheta) . toFloat) [0..n-1])
         in map (\(frm, t) -> {frm|x <- x + r * cos t,
                                   y <- y + r * sin t}
                              |> rotate t) zipped

