extends Node2D

@onready var timer: Timer = $Timer
@onready var number: Label = $CanvasLayer/Number
@onready var player_score_label: Label = $CanvasLayer/PlayerScore
@onready var enemy_score_label: Label = $CanvasLayer/EnemyScore

var countdown: int = 3

func _ready():
	SignalManager.on_scoreboard_update.connect(update_scoreboard)
	
	update_scoreboard()
	
	number.text = str(countdown)
	number.visible = true
	timer.start()

func _on_timer_timeout():
	countdown -= 1
	
	if countdown > 0:
		number.text = str(countdown)
		timer.start()
	else:
		number.visible = false
		SignalManager.on_countdown_complete.emit()

func update_scoreboard():
	player_score_label.text = str(ScoreManager.player_score)
	enemy_score_label.text = str(ScoreManager.enemy_score)
