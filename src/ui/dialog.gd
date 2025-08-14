## src/ui/dialog.gd
## Simple wrapper for boilerplate "dialogs".
##

extends Control

func _ready():
	var close_button = find_child("CloseButton")
	if not close_button:
		return null
	close_button.pressed.connect(self.hide)
