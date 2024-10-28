extends Node

var ball_location: Vector2
var game_started: bool = false

func _ready():
	SignalManager.on_countdown_complete.connect(start_game)

func set_ball_location(bl: Vector2):
	ball_location = bl

func get_ball_location():
	return ball_location

func start_game():
	game_started = true

func get_game_started():
	return game_started
