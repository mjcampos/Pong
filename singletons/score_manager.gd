extends Node

var player_score: int = 0
var enemy_score: int = 0

func _ready():
	SignalManager.on_score_update.connect(update_score)
	
func update_score(goaltype: GameManager.GoalType):
	match goaltype:
		GameManager.GoalType.PLAYER:
			enemy_score += 1
		GameManager.GoalType.ENEMY:
			player_score += 1

	SignalManager.on_scoreboard_update.emit()
