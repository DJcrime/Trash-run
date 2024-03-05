extends Control

func _ready():
	Globals.connect("checkTrashValue",checkTrashValue)

func checkTrashValue():
	if (!Globals.gameOver&&!Globals.pause):
		$Container/barra.position.y=500-Globals.trashValue*3
