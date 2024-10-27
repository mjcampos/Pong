extends CharacterBody2D

var speed = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var random_angle = randf() * 360
	
	velocity = Vector2(cos(random_angle), sin(random_angle)) * 500

func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
