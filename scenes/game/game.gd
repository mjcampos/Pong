extends Node2D

@onready var timer: Timer = $Timer
@onready var number: Label = $CanvasLayer/Number

var countdown: int = 3

func _ready():
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
