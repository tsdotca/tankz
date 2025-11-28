## src/Player.gd
## Human tank player.

class_name Player extends Tank


signal fired_projectile(player: Player)


func _input(event):
	if event is InputEventMouseMotion:
		return
		
	elif event.is_action("p1_angle_down"):
		angle += angle_rate
		if angle > 0.0:
			angle = 0.0
		# TODO: else play cranking sound
		$Turret.rotation = angle

	elif event.is_action(&"p1_power_up"):
		power = min(power + 1.0, 100.0)

	elif event.is_action(&"p1_power_down"):
		power = max(power - 1.0, 0.0)
		
	elif event.is_action(&"p1_fire"):
		fire_projectile()

	else:
		return

	get_viewport().set_input_as_handled()
	Tankz.emit_signal(&"player_ui_updated")
