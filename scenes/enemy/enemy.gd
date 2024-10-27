extends CharacterBody2D

@export var _speed: float = 100.0

var fixed_x_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	fixed_x_position = position.x

func _physics_process(delta):
	var ball_location: Vector2 = GameManager.get_ball_location()
	
	# Only move along the y-axis towards the ball
	if ball_location.y > position.y:
		velocity.y = _speed  # Move downwards
	elif ball_location.y < position.y:
		velocity.y = -_speed  # Move upwards
	else:
		velocity.y = 0  # Stop moving if aligned with the puck
		
	# Move the paddle using the calculated velocity
	move_and_slide()
	
	position.x = fixed_x_position
