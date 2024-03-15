extends Node

#scene
const MAIN_GAME = "res://scenes/mainGame.tscn"
const SLIDER = "res://scenes/slider.tscn"
const HELP = "res://scenes/help.tscn"
const IMPOSTAZIONI = preload("res://scenes/impostazioni.tscn")

func _ready():
	$AudioStreamPlayer2D.playing=Globals.sound#se sound è true perchè è attivo allora parte anche il sound
	Globals.connect("checkSound",checkSound)

func checkSound():
	$AudioStreamPlayer2D.playing=Globals.sound

func _on_play_pressed():
	get_tree().change_scene_to_file(MAIN_GAME)


func _on_change_character_pressed():
	get_tree().change_scene_to_file(SLIDER)


func _on_help_pressed():
	get_tree().change_scene_to_file(HELP)


func _on_impostazioni_pressed():
	if len($CanvasLayer/menuImpostazioni.get_children())<1:
		var imp=IMPOSTAZIONI.instantiate()
		$CanvasLayer/menuImpostazioni.add_child(imp)
