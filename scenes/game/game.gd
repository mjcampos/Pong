extends Node2D

@onready var timer: Timer = $Timer

var countdown: int = 3

func _on_timer_timeout():
	countdown -= 1
	
	if countdown > 0:
		print(str(countdown) + " seconds left")
		timer.start()
	else:
		SignalManager.on_countdown_complete.emit()
