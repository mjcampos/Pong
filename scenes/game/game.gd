extends Node2D

@onready var timer: Timer = $Timer
@onready var number_label: Label = $CanvasLayer/Number
@onready var player_score_label: Label = $CanvasLayer/PlayerScore
@onready var enemy_score_label: Label = $CanvasLayer/EnemyScore
@onready var winner_label: Label = $CanvasLayer/Winner
@onready var instructions_label: Label = $CanvasLayer/Instructions

var countdown: int

func _ready():
	SignalManager.on_scoreboard_update.connect(set_scoreboard)
	SignalManager.on_reset_position.connect(reset_position)
	SignalManager.on_game_over.connect(announce_winner)
	
	default_label_settings()
	start_countdown()

func _process(_delta):
	if GameManager.winner_determined:
		if Input.is_action_just_pressed("reset"):
			GameManager.reset_scene()
		
		if Input.is_action_just_pressed("exit"):
			GameManager.go_to_main()

func default_label_settings():
	# Set scoreboards to 0
	set_scoreboard()
	
	number_label.visible = true
	player_score_label.visible = true
	enemy_score_label.visible = true
	winner_label.visible = false
	instructions_label.visible = false

func start_countdown():
	countdown = 3
	number_label.text = str(countdown)
	number_label.visible = true
	timer.start()

func _on_timer_timeout():
	countdown -= 1
	
	if countdown > 0:
		number_label.text = str(countdown)
		timer.start()
	else:
		number_label.visible = false
		SignalManager.on_countdown_complete.emit()

func set_scoreboard():
	player_score_label.text = str(ScoreManager.player_score)
	enemy_score_label.text = str(ScoreManager.enemy_score)

func reset_position():
	start_countdown()

func announce_winner():
	match ScoreManager.winner:
		GameManager.GoalType.PLAYER:
			winner_label.text = "Player Wins!!!"
		GameManager.GoalType.ENEMY:
			winner_label.text = "Enemy Wins!!!"
			
	winner_label.visible = true
	instructions_label.visible = true
