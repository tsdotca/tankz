# tanks README.md

## Build Instructions

1. build with godot
2. ???
3. win

## A Note on Conventions and Jargon

All angles are stored and expressed in the code as radians, except when it comes to the
user-interface.

Because Godot uses `direction` to refer to a node 2D's transform, and/or it may cause name clashes,
the game logic will sometimes refer to "direction", but that is only with respect to, outside of the
context of a projectile's actual current direction, the direction ("rotation") of a tank's turret.
