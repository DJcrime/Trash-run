extends Control

#scene
const MENU = "res://scenes/menu.tscn"




func _on_button_left_pressed():
	$Control.position=$Control.position-Vector2(1152,0)


func _on_button_right_pressed():
	$Control.position=$Control.position-Vector2(-1152,0)





func _on_umido_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/organico_trash.tscn")


func _on_plastic_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/plastic_trash.tscn")


func _on_glass_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/glass_trash.tscn")


func _on_paper_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/paper_trash.tscn")


func _on_garbage_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/base_character.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file(MENU)
