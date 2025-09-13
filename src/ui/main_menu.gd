## src/ui/main_menu.gd
class_name MainMenu extends Node

@export var _tank_preview: TextureRect
@export var _tankfx_preview: TextureRect

@export var _current_tank := 0
@export var _current_fx := 0

@export var _tank_previews: Array = [
	preload("res://assets/tanks/tanks_tankGreen1.png"),
	preload("res://assets/tanks/tanks_tankGreen2.png"),
	preload("res://assets/tanks/tanks_tankGreen3.png"),
	preload("res://assets/tanks/tanks_tankGreen4.png"),
	preload("res://assets/tanks/tanks_tankGreen5.png"),
	
	preload("res://assets/tanks/tanks_tankGrey1.png"),
	preload("res://assets/tanks/tanks_tankGrey2.png"),
	preload("res://assets/tanks/tanks_tankGrey3.png"),
	preload("res://assets/tanks/tanks_tankGrey4.png"),
	preload("res://assets/tanks/tanks_tankGrey5.png"),
	
	preload("res://assets/tanks/tanks_tankNavy1.png"),
	preload("res://assets/tanks/tanks_tankNavy2.png"),
	preload("res://assets/tanks/tanks_tankNavy3.png"),
	preload("res://assets/tanks/tanks_tankNavy4.png"),
	preload("res://assets/tanks/tanks_tankNavy5.png"),
]

@export var _fx_previews: Array = [
	preload("res://assets/tanks/tanks_crateAmmo.png")
]


func _ready():
	_tank_preview.texture = _tank_previews[_current_tank]
	_tankfx_preview.texture = _fx_previews[_current_fx]


func on_new_game_button_pressed() -> void:
	$NewGamePopup.show()
	$OptionsPopup.hide()


func on_options_button_pressed() -> void:
	$NewGamePopup.hide()
	$OptionsPopup.show()


func on_quit_button_pressed() -> void:
	get_tree().quit(0)
	
# TODO: update button state for all of this crap
	
func on_tank_preview_prev_pressed() -> void:
	_current_tank -= 1
	_current_tank = min(max(0, _current_tank), _tank_previews.size() - 1)
	_tank_preview.texture = _tank_previews[_current_tank]

func on_tank_preview_next_pressed() -> void:
	_current_tank += 1
	_current_tank = min(max(0, _current_tank), _tank_previews.size() - 1)
	_tank_preview.texture = _tank_previews[_current_tank]

func on_tank_fx_prev_pressed() -> void:
	_current_fx -= 1
	_current_fx = min(max(0, _current_fx), _fx_previews.size() - 1)
	_tankfx_preview.texture = _fx_previews[_current_fx]

func on_tank_fx_next_pressed() -> void:
	_current_fx += 1
	_current_fx = min(max(0, _current_fx), _fx_previews.size() - 1)
	_tankfx_preview.texture = _fx_previews[_current_fx]


func on_is_fullscreen_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)

func on_is_vsync_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if toggled_on else DisplayServer.VSYNC_DISABLED)

func on_music_volume_value_changed(value: float) -> void:
	pass

func on_fx_volume_value_changed(value: float) -> void:
	pass


func on_about_and_info_pressed() -> void:
	print("i need to have some kind of webbrowser open url")


func on_start_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/stage.tscn")
