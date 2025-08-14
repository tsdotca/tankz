## src/main_menu.gd

extends Node

@onready var _tank_preview: TextureRect = find_child("TankPreview")
@onready var _current_tank: int = 0
@onready var _tank_previews: Array = [
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


func _on_new_game_button_pressed() -> void:
	find_child("NewGameRect").show()
	find_child("OptionsRect").hide()


func _on_options_button_pressed() -> void:
	find_child("NewGameRect").hide()
	find_child("OptionsRect").show()


func _on_quit_button_pressed() -> void:
	get_tree().quit(0)


func _on_prev_tank_bling_arrow_pressed() -> void:
	_current_tank -= 1
	_current_tank = min(max(0, _current_tank), _tank_previews.size())
	_tank_preview.texture = _tank_previews[_current_tank]


func _on_next_tank_bling_arrow_pressed() -> void:
	_current_tank += 1
	_current_tank = min(max(0, _current_tank), _tank_previews.size())
	_tank_preview.texture = _tank_previews[_current_tank]


func _on_is_fullscreen_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)

func _on_is_vsync_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if toggled_on else DisplayServer.VSYNC_DISABLED)


func _on_music_volume_value_changed(value: float) -> void:
	pass


func _on_fx_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_about_and_info_pressed() -> void:
	print("i need to have some kind of webbrowser open url")


func _on_game_config_button_pressed() -> void:
	pass # Replace with function body.


func _on_player_name_edit_text_changed(new_text: String) -> void:
	pass # Replace with function body.


func _on_player_name_edit_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_is_fullscreen_pressed() -> void:
	pass # Replace with function body.

func _on_start_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/stage.tscn")
