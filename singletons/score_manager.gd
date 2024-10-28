extends Node

var player_score: int = 0
var enemy_score: int = 0
var points_needed: int = 3
var winner

func _ready():
	SignalManager.on_score_update.connect(update_score)
	
func update_score(goaltype: GameManager.GoalType):
	match goaltype:
		GameManager.GoalType.PLAYER:
			enemy_score += 1
		GameManager.GoalType.ENEMY:
			player_score += 1

	SignalManager.on_scoreboard_update.emit()
	
	await get_tree().create_timer(1.0).timeout
	
	find_winner()

func find_winner():
	if player_score >= points_needed:
		winner = GameManager.GoalType.PLAYER
		SignalManager.on_game_over.emit()
	elif enemy_score >= points_needed:
		winner = GameManager.GoalType.ENEMY
		SignalManager.on_game_over.emit()
	else:
		SignalManager.on_reset_position.emit()

func default_settings():
	player_score = 0
	enemy_score = 0
	winner = null
