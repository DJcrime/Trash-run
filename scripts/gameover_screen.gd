extends Control

#scene
const MAIN_GAME = "res://scenes/mainGame.tscn"
const MENU = "res://scenes/menu.tscn"

func _on_back_pressed():
	Globals.gameOver=false
	Globals.score=0
	get_tree().change_scene_to_file(MENU)


func _on_restart_pressed():
	Globals.gameOver=false
	Globals.score=0
	get_tree().change_scene_to_file(MAIN_GAME)


func _on_continue_pressed():
	Globals.gameOver=false
	queue_free()
