## src/Player.gd
## Human tank player.

class_name Player extends Tank

signal power_changed(power: float)
signal angle_changed(angle: float)


func fire_projectile():
	print("pew")
	var projectile = preload("res://src/projectile.tscn").instantiate()
	projectile.firepower = self.power
	projectile.angle = self.angle
	add_child(projectile)

func _input(event):
	# stop log and output spam
	if event is InputEventMouseMotion:
		return

	if event.is_action_pressed("p1_fire"):
		self.fire_projectile()
		
	##
	
	elif event.is_action("p1_angle_up"):
		angle -= 0.1
		print(")))")
		print(self.get_parent().find_child("Turret"))
		self.get_children()[2].rotation = angle  # FIXME: HACK: For some reason $Turret isn't working.
		
	elif event.is_action("p1_angle_down"):
		angle = max(angle + angle_rate, -0.5)
		self.get_children()[2].rotation = angle

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
		
