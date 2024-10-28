extends CharacterBody2D

var speed: float = 400.0
var fixed_x_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	fixed_x_position = position.x

func _physics_process(delta):
	if GameManager.get_game_started():
		var direction = Input.get_axis("ui_up", "ui_down")
		
		velocity.y = direction * speed
		
		move_and_slide()

		position.x = fixed_x_position
