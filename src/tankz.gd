## src/tankz.gd
## Primary game logic and state.
##
## The playable game is divided temporally into turns and rounds, and spatially
## by a Stage. See stage.gd.
##
## The game state may only be in one of the following:
##   1. There is a pending projectile, and the game animates its effects
##   2. A player is 
##   3. Wipe-out. A player died and needs to be cleaned up.
##      This is where the explosions can get fun. I mean brutal.
extends Node


const DEFAULT_POWER := 1


enum GameState {
	## Freezes the game state, including animations. Useful in menus.
	SIMSTOP,
	
	## Also counts for menus.
	PAUSED,
	
	## Main game phase. Choose thy target...
	SELECTION,
	
	## Someone fired a projectile, and the game is waiting for the results to happen.
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

var _current_state = GameState.PAUSED
## The state resumed after pausing, e.g., interacting with menus.
var _previous_state := GameState.PAUSED


class GameSettings extends Resource:
	pass


class GameConfig extends Node:
	var config_file_path := ""
	var _source_cfg: ConfigFile = null
	
	var tank_style := 0
	var crumble_percent := 0.25
	var background_name := "stars.png"
	
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
	var settings := 0xEF


var game_settings = null
var gameconfig: GameConfig = null
var players := []
var current_player := 0
var pending_projectile = null
## The thing that we query for input, event data, etc.
var controller: TankzController = null


func _ready():
	pass


func pause_game():
	if _current_state == GameState.PAUSED:
		print("warning: already paused")
	else:
		_previous_state = _current_state
		_current_state = GameState.PAUSED


func resume_game():
	if _current_state != GameState.PAUSED:
		print("warning: game already resumed")
	else:
		var tmp = _current_state
		_current_state = _previous_state
		_previous_state = tmp


func _process(delta: float) -> void:
	pass
