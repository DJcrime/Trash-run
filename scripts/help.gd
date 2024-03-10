extends Control

#scene
const MENU = "res://scenes/menu.tscn"
const BARRA_RIFIUTI = preload("res://scenes/slider boxes/barraRifiuti.tscn")
const BIGLIETTI_GIALLI = preload("res://scenes/slider boxes/bigliettiGialli.tscn")
const COME_GIOCARE = preload("res://scenes/slider boxes/comeGiocare.tscn")
const OBBIETTIVO = preload("res://scenes/slider boxes/obbiettivo.tscn")
const SPAZZATURA = preload("res://scenes/slider boxes/spazzatura.tscn")
#sliderBoxes
var boxes:Array=Array([BARRA_RIFIUTI,BIGLIETTI_GIALLI,COME_GIOCARE,OBBIETTIVO,SPAZZATURA])
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

func _on_back_pressed():
	get_tree().change_scene_to_file(MENU)
