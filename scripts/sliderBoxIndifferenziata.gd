extends ColorRect

func _on_garbage_2_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/base_character.tscn")
