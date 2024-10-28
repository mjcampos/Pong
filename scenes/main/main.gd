extends Control

func _on_play_button_pressed():
	GameManager.go_to_game()


func _on_help_button_pressed():
	GameManager.go_to_help()
