extends CharacterBody2D

@export var _speed: float = 100.0

var fixed_x_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	fixed_x_position = position.x

func _physics_process(delta):
	move_and_slide()
