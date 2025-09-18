## src/Player.gd
## Human tank player.

class_name Player extends Tank

signal power_changed(power: float)
signal angle_changed(angle: float)
signal fired_projectile(player: Player)


func _input(event):
	# Prevent log spam
	if event is InputEventMouseMotion:
		return

	# Note: anything added here that falls through will affirm the event.
	#

	if event.is_action_pressed("p1_fire"):
		emit_signal("fired_projectile", self)

	##
	elif event.is_action("p1_angle_up"):
		angle -= angle_rate
		if angle < -PI/2:
			angle = -PI/2
		# TODO: else play cranking sound
		$Turret.rotation = angle
		
	elif event.is_action("p1_angle_down"):
		angle += angle_rate
		if angle > 0.0:
			angle = 0.0
		# TODO: else play cranking sound
		$Turret.rotation = angle

	##
	elif event.is_action("p1_power_up"):
		power = min(power + 1.0, 100.0)

	elif event.is_action("p1_power_down"):
		power = max(power - 1.0, 0.0)

	##
	else:
		return

	get_viewport().set_input_as_handled()
	Tankz.emit_signal("player_ui_updated")
