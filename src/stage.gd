## src/stage.gd
## Level / stage management.
##
## Stages are divided into a boolean bitmap, where 1 indicates terrain, 0
## indicates no terrain (either it never existed or existed
##
## Stages also have a list of players and their stats, and a pending projectile.
##
## All spots a tank occupies are cleared where the tank spawns, and keeping with
## the original game's (silly) logic, rotating the turret clears a small area
## around the tank.
class_name Stage extends Node2D

var h := 128
var w := 128
# TODO: Port this to C++ for more precise control.
var _meat = []

var tanks := []


func _ready() -> void:
	pass



func generate_flat_world(y=0):
	pass
	
	
func world_from_bitmap(bitmap: BitMap) -> Stage:
	return null


func is_occupied(x, y):
	pass
