import Graphics.Collage (circle, filled, move, collage, group, alpha, Form)
import Graphics.Element (Element, flow, down, container, middle)
import Color
import Text
import Array
import Maybe
import Signal
import Mouse

import Align
import Distribute

options : Array.Array (String, List Form -> List Form)
options = Array.fromList [("Original", identity)
                         ,("Align.top", Align.top)
                         ,("Align.bottom", Align.bottom)
                         ,("Align.left", Align.left)
                         ,("Align.right", Align.right)
                         ,("Align.horizontal", Align.horizontal)
                         ,("Align.vertical", Align.vertical)
                         ,("Distribute.horizontal", Distribute.horizontal)
                         ,("Distribute.vertical", Distribute.vertical)
                         ,("Distribute.horizontalAlong 100", Distribute.horizontalAlong 100)
                         ,("Distribute.verticalAlong 100", Distribute.verticalAlong 100)
                         ,("Distribute.radial", Distribute.radial (0,0) 150)
                         ]

dots =
    [ circle 20 |> filled Color.red |> move (230, 100)
    , circle 20 |> filled Color.orange |> move (-200, -150)
    , circle 20 |> filled Color.green |> move (-80, -20)
    , circle 20 |> filled Color.blue |> move (80, 180)
    , circle 20 |> filled Color.purple |> move (-150, 140)
    , circle 20 |> filled Color.black
    ]

title : String -> Element
title s = let format = Text.fromString >> Text.height 36 >> Text.typeface ["Futura"] >> Text.centered
          in container 600 50 middle (format s)

subtitle : String -> Element
subtitle s = let format = Text.fromString >> Text.height 24 >> Text.typeface ["Futura"] >> Text.centered
          in container 600 30 middle (format s)

scene : Int -> Element
scene i = let (s,f) = Array.get i options |> Maybe.withDefault ("Original", identity)
              pic =  collage 600 500 <| [ group dots |> alpha 0.5 ] ++ f dots
              caption = if | i == 7 || i == 9 -> "Equal vertical slices"
                           | i == 8 || i == 10 -> "Equal horizontal slices"
                           | i == 11 -> "Around origin, r = 150"
                           | otherwise -> "Click to cycle"
          in flow down [title s, pic, subtitle caption]

num : Signal Int
num = Signal.foldp (\_ old -> (old + 1) % Array.length options) 0 Mouse.clicks

main = Signal.map scene num

