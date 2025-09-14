## src/tank.gd
class_name Tank extends Node2D


@export var hp := 100  # (0, 100]
@export var power := 50  # (0, 100]
@export var angle :=  0.0
const angle_rate := PI / 100
@export var money := 0  #  >= 0

# TODO: Refactor when multiple turret types are supported.
const turret_offset = 32


func fire_projectile():
	var projectile = preload("res://src/projectile.tscn").instantiate() as Projectile
	projectile.name = "Shot fired by %s" % name
	projectile.position = position + Vector2(96 * cos(angle), turret_offset - turret_offset * sin(angle)) * scale
	projectile.firepower = self.power
	projectile.angle = self.angle
	get_parent().add_child(projectile)
