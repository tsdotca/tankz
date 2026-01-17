## src/ui/dialog.gd
## Simple wrapper for boilerplate "dialogs".
##

extends Control


func _ready() -> void:
	var close_button = find_child("CloseButton")
	if not close_button:
		return
	close_button.pressed.connect(self.hide)
