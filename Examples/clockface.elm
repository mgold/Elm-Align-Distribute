import List (map, reverse)
import Graphics.Collage (..)
import Text
import Color

import Distribute

hours = map (toString >> Text.fromString >> Text.centered >> toForm) <| [3,2,1] ++ reverse [4..12]
ovals = map (\k -> oval 50 30 |> filled Color.lightBlue) [1..12]
main = collage 400 400 <| Distribute.radialRotate (0,0) 100 ovals
                       ++ Distribute.radial       (0,0) 100 hours
