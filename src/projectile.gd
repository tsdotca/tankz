## src/projectile.gd
## This is where the fun happens.
class_name Projectile extends Node2D

@export var velocity: float
@export var firepower: float  # the firepower when this projectile was fired
@export var angle: float

@export var dt: float

@onready var _velocity: Vector2 = Vector2(sin(angle) + firepower/10 + 1, -cos(angle))


func _physics_process(delta: float) -> void:
	dt += delta
	# Vector2(firepower / 10, -(Tankz.state.gravity * (angle - dt)))
	position += _velocity + Vector2(0, firepower/50.0 + sqrt(dt) * Tankz.state.gravity)
