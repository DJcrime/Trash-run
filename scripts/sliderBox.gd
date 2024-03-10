extends ColorRect

var spost=1152

func _ready():
	spost=DisplayServer.window_get_size().x

func _process(_delta):
	if global_position.x<-spost*2:
		global_position.x=spost*2
	if global_position.x>spost*2:
		global_position.x=-spost*2


func _on_umido_2_screen_entered():
	Globals.chosenCharacter=preload("res://characters/player/organico_trash.tscn")
