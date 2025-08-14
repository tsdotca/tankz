## src/projectile.gd
## This is where the fun happens.
class_name Projectile extends Node2D

## How many times per event loop the projectile polls for game events.
var _sample_rate = 1 # ??????????
## Trail breadcrumbs
var _breadcrumbs := []

## fire context TODO explain this
var fire_context := {
	'initial_tank_conditions': {
		'power': Tankz.DEFAULT_POWER, 
		'angle': Vector2.UP,
		'base_damage': Tanks.BASE_DAMAGE,
		
	}
}

##
var origin: Vector2
var dest: Vector2

## Newton 2nd
func impact_force():
	return 0.0


func _ready():
	
