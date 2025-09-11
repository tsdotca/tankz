## src/tank.gd
class_name Tank extends Node2D

@onready var _turret = $Turret
@onready var _body = $Body

@export var hp := 100  # (0, 100]
@export var power := 50  # (0, 100]
var angle :=  0  # radians
const angle_rate := 0.1   # radians
var money := 0  #  >= 0
