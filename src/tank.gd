## src/tank.gd
class_name Tank extends Node2D

@export var hp := 100  # (0, 100]
@export var power := 50  # (0, 100]
@export var angle :=  0.0
const angle_rate := PI / 100
@export var money := 0  #  >= 0

# TODO: Refactor when multiple turret types are supported.
const turret_offset = -32
@export var projectile_spawn_offset := Vector2(96, turret_offset)

func fire_projectile():
	print("pew")
	var projectile = preload("res://src/projectile.tscn").instantiate()
	
	projectile.name = "Shot fired by %s" % name
	projectile.position = (position + projectile_spawn_offset).rotated(angle)
	projectile.firepower = self.power
	projectile.angle = self.angle
	get_parent().add_child(projectile)
