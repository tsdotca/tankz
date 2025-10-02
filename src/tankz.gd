## src/tankz.gd
## Primary game logic and state.
##
## The playable game is divided temporally into turns and rounds, and spatially
## by a Stage. See stage.gd.
##
## The game state may only be in one of the following.
##   1. Pause state.
##   2. There is a pending projectile, and the game animates its effects.
##   3. Wipe-out. A player died and needs to be cleaned up.
##      This is where the explosions can get fun. I mean brutal.
extends Node

signal config_changed(config)
signal player_ui_updated


class Config extends Resource:
	@export var fullscreen: int = ProjectSettings.get_setting("display/window/size/mode")
	@export var resolution := [
		ProjectSettings.get_setting("display/window/size/viewport_height"),
		ProjectSettings.get_setting("display/window/size/viewport_height"),
	]
	@export var vsync: bool = ProjectSettings.get_setting("display/window/size/mode")


class GameState extends Node:
	enum Mode {
		## Certain game-specific aspects are disabled, but the game still "runs". Useful in the main
		## menu.
		DEMO,
		
		## Freezes the game state, including animations.
		PAUSED,
		
		## Main game phase. Choose thy target...
		SELECTION,
		
		## Someone fired a projectile, and the game processing those events before allowing game-related
		## input.is waiting for the results to happen.
		## Can be bypassed, which is why it is its own thing.
		PENDING,
		
		## A tank was destroyed and the results of such are playing out, including cascading other 
		## WIPEOUT events. For example, tank1 blows up and takes out tank2. tank2's death creates a 
		## new WIPEOUT context that may alter the level, chain yet again into WIPEOUTs,
		## or influence tank1's WIPEOUT
		##
		## Control is sealed, animations play normally, events are processed. Can be skipped in
		## single-player mode.
		WIPEOUT,
	}
	
	@export var mode := Mode.DEMO
	## The mode resumed after pausing, e.g., interacting with menus.
	@export var prev_mode := Mode.PAUSED
	
	@export var tank_style := 0
	@export var wind_factor := 1.0  # +/- force only
	@export var crumble_percent := 0.25
	@export var background_name := "bliss.png"
	
	@export var gravity := 0.0
	
	enum WindForce {
		CHAOS,
		CALM,
		BREEZE,
		STORM,
		GALEFORCE,
		ROCKSFALLEVERYONEDIES,
	}
	
	enum SettingFlags {
		HAS_WALLS,
		IS_TRAIL_VISIBLE,
		IS_BALL_VISIBLE,
		DO_TANKS_FALL,
		CAN_BOTS_BUY,
		CYCLE_DELAY,  # ???
		WIND_FORCE, # one of...???
		ARE_TEAMS_ENABLED,
	}
	@export var settings: int = 0xEF

	@export var players := []	
	@export var _wocontexts := []
	@export var current_player := 0
	@export var pending_projectile = null
	
	func _init():
		# no fun allowed  >:(
		if gravity == 0.0:
			gravity = ProjectSettings.get_setting("physics/2d/default_gravity") / 200.0

@export var preferences: Config = Config.new()
@export var state: GameState


## See GameState.WIPEOUT for why this crap all exists.
## They are nodes so the GameState can store them as children.
class WipeoutContext extends Node:
	@export var active_projectile: Projectile


func _ready():
	state = GameState.new()
	
	
func change_stage_to(stage_name: String) -> void:
	state.queue_free()
	get_tree().change_scene_to_file(stage_name)
	
	
func on_player_fire(player):
	print("player %s fired" % player.name)

# Calculate and normalise wind force.
func wind():
	return Vector2(Tankz.state.wind_factor, 0)
