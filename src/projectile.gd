## src/projectile.gd
## This is where the fun happens.
class_name Projectile extends Node2D

@export var angle: float  # rotation of tank turrent (-PI, PI)
@export var firepower: float  # the firepower when this projectile was fired from
@export var dt: float  # culmulative time delta. used for efx and sfx

@onready var _accel = Vector2(sin(angle) + firepower * 10.0, -cos(angle))
@onready var _velocity: Vector2 = Vector2(0.0, 0.0)


func _physics_process(delta: float) -> void:
	dt += delta
	_velocity += _accel * delta
	position += _velocity * delta
