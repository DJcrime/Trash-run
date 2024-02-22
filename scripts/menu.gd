extends Node

#scene
const MAIN_GAME = "res://scenes/mainGame.tscn"
const SLIDER = "res://scenes/slider.tscn"

func _on_play_pressed():
	get_tree().change_scene_to_file(MAIN_GAME)


func _on_change_character_pressed():
	get_tree().change_scene_to_file(SLIDER)
