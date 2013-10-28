# Align and Distribute Libraries for Elm

A pair of libraries for arranging forms in [Elm](elm-lang.org), by Max Goldstein.  

Function names are chosen with the expectation that the modules will imported
qualified, e.g. `Align.top`.  

Examples are given in the top-level directory because Elm does not currently support importing custom modules from other directories.  

## Align
Aligns all forms to the edge or centerline of the bounding box of the centers of the forms.

````
Align.top    : [Form] -> [Form]
Align.bottom : [Form] -> [Form]
Align.left   : [Form] -> [Form]
Align.right  : [Form] -> [Form]
Align.horiz  : [Form] -> [Form]
Align.vert   : [Form] -> [Form]
````

## Distribute
Distribute forms with even distances from center-to-center within their bounding box. The extema do not move.

````
Distribute.horiz : [Form] -> [Form]
Dsitribute.vert  : [Form] -> [Form]
````

Distribute forms with even distances from center-to-center along the given length, centered.

````
Distribute.horizAlong : Float -> [Form] -> [Form]
Dsitribute.vertAlong  : Float -> [Form] -> [Form]
````

Distribute forms with even angular spacing around a centerpoint at a given
radius, and optionally rotate them.

````
Distribute.angular    : (Float, Float) -> Float -> [Form] -> [Form]
Distribute.angularRot : (Float, Float) -> Float -> [Form] -> [Form]
````
