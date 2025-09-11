## src/projectile.gd
## This is where the fun happens.
class_name Projectile extends Node2D

@export var firepower: int  # the firepower when this projectile was fired
@export var angle:  float  # the angle the tank was aiming with
