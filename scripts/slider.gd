extends Control

#scene
const MENU = "res://scenes/menu.tscn"
const VETRO = preload("res://scenes/slider boxes/vetro.tscn")
const CARTA = preload("res://scenes/slider boxes/carta.tscn")
const INDIFFERENZIATA = preload("res://scenes/slider boxes/indifferenziata.tscn")
const PLASTICA = preload("res://scenes/slider boxes/plastica.tscn")
const UMIDO = preload("res://scenes/slider boxes/umido.tscn")
#sliderBoxes
var boxes:Array=Array([UMIDO,PLASTICA,VETRO,CARTA,INDIFFERENZIATA])
#indice box
var chosenBox:int=0
func _ready():
	var box=boxes[chosenBox].instantiate()
	$Control.add_child(box)

func _on_button_left_pressed():
	clearBox()
	if chosenBox==0:
		chosenBox=4
	else:
		chosenBox-=1
	var box=boxes[chosenBox].instantiate()
	$Control.add_child(box)


func _on_button_right_pressed():
	clearBox()
	if chosenBox==4:
		chosenBox=0
	else:
		chosenBox+=1
	var box=boxes[chosenBox].instantiate()
	$Control.add_child(box)

func clearBox():
	$Control.remove_child($Control.get_child(0))

func _on_button_pressed():
	get_tree().change_scene_to_file(MENU)
