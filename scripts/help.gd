extends Control

#scene
const MENU = "res://scenes/menu.tscn"




func _on_button_left_pressed():
	$Control.position=$Control.position-Vector2(1152,0)


func _on_button_right_pressed():
	$Control.position=$Control.position-Vector2(-1152,0)


func _on_back_pressed():
	get_tree().change_scene_to_file(MENU)
