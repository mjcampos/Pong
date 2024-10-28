extends Area2D


@export var goal_type = GameManager.GoalType.PLAYER

func _on_body_entered(body):
	SignalManager.on_score_update.emit(goal_type)
