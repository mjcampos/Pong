extends CharacterBody2D

var speed: float = 400.0
var fixed_x_position: float
var starting_y_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_reset_position.connect(reset_position)
	
	fixed_x_position = position.x
	starting_y_position = position.y

func _physics_process(delta):
	if GameManager.get_game_started():
		var direction = Input.get_axis("ui_up", "ui_down")
		
		velocity.y = direction * speed
		
		move_and_slide()

		position.x = fixed_x_position

func reset_position():
	position.y = starting_y_position
