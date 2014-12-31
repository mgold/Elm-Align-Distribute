# Align and Distribute for Elm

A pair of libraries for arranging forms in [Elm](elm-lang.org), by Max Goldstein.

![Demonstration Animation](/Examples/animation.gif?raw=true)

The code for the above gif (more or less) is available in the examples directory.

Submit bugs, requests, and the like through GitHub.

## Align

Aligns all forms to the edge or centerline of the bounding box of the centers
of the forms. In all cases, only one of the _x_ and _y_ coordinates is changed.

````
Align.top         : List Form -> List Form
Align.bottom      : List Form -> List Form
Align.left        : List Form -> List Form
Align.right       : List Form -> List Form
Align.horizontal  : List Form -> List Form
Align.vertical    : List Form -> List Form
````

## Distribute

Distribute forms with even distances from center-to-center within their
bounding box. Distributing horizontally changes only the _x_ coordinate, and
distributing vertically changes only the _y_ coordinate.

````
Distribute.horizontal : List Form -> List Form
Dsitribute.vertical   : List Form -> List Form
````

Distribute forms with even distances from center-to-center along the given
length, centered.

````
Distribute.horizAlong : Float -> List Form -> List Form
Dsitribute.vertAlong  : Float -> List Form -> List Form
````

Distribute forms with even angular spacing around a centerpoint at a given
radius. Forms are kept in the order provided, with the first form being
directly left of the centerpoint and others going counterclockwise. Optionally,
rotate the forms by an amount proportional to their angle.

````
Distribute.angular    : (Float, Float) -> Float -> List Form -> List Form
Distribute.angularRot : (Float, Float) -> Float -> List Form -> List Form
````
