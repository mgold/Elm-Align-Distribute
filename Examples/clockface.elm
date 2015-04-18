import List exposing (map, reverse)
import Graphics.Collage as Collage
import Text
import Color

import Distribute

hours = map (toString >> Text.fromString >> Collage.text) <| [3,2,1] ++ reverse [4..12]
ovals = map (\k -> Collage.oval 50 30 |> Collage.filled Color.lightBlue) [1..12]
main = Collage.collage 400 400 <| Distribute.radialRotate (0,0) 100 ovals
                       ++ Distribute.radial       (0,0) 100 hours
