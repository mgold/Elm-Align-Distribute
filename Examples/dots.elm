import Align

dots =
    [ circle 20 |> filled red |> move (230, 100)
    , circle 20 |> filled orange |> move (-200, -150)
    , circle 20 |> filled blue |> move (80, 180)
    , circle 20 |> filled green |> move (-80, -20)
    , circle 20 |> filled black
    ]

main = collage 600 600 <| [ group dots |> alpha 0.5 ] ++ Align.horiz dots
