extends CharacterBody2D

@onready var hit_sound: AudioStreamPlayer2D = $HitSound

var speed = 600.0
var starting_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_reset_position.connect(reset_position)
	
	set_random_velocity()

func _physics_process(delta):
	if GameManager.get_game_started():
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		
		if collision:
			hit_sound.position = position
			hit_sound.play()
			velocity = velocity.bounce(collision.get_normal())

	# Update the ball's location in the Game Manager to allow the Enemy AI to move accordingly
	GameManager.set_ball_location(position)

func set_random_velocity():
	var random_angle = randf() * 360
	
	starting_position = position
	velocity = Vector2(cos(random_angle), sin(random_angle)) * speed
	
func reset_position():
	position = starting_position
	set_random_velocity()
