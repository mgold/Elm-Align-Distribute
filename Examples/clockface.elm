import Distribute

hours = map (toForm . centered . toText . show) <| [3,2,1] ++ reverse [4..12]
ovals = map (\k -> oval 50 30 |> filled lightBlue) [1..12]
main = collage 400 400 <| Distribute.angularRotate (0,0) 100 ovals
                       ++ Distribute.angular       (0,0) 100 hours
