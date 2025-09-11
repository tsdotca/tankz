## src/ui/game_ui.gd
## In-game UI for stages.
class_name GameUi extends Control

# for testing purposes only
@export var tank: Tank


func _ready():
	Tankz.player_ui_updated.connect(self.update)
	update()


func update():
	$PlayerName.text = tank.name
	$Angle.text = str(tank.angle)
	$Power.text = str(tank.power)
	$Direction.text = "--->" if tank.angle < 0.5 else "<---"
	$HP.text = str(tank.hp)
	$Wind.text = str(Tankz.state.wind_factor)
