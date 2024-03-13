extends Control

func _ready():
	checkColor()

func checkColor():
	if Globals.sound:
		$TextureRect2.modulate=Color("00ff00")#setta immagine bottone musica verde
	else:
		$TextureRect2.modulate=Color("ff0000")#rosso
	if Globals.sfx:
		$TextureRect3.modulate=Color("00ff00")#stessa cosa per effetti verde
	else:
		$TextureRect3.modulate=Color("ff0000")#rosso

func _on_back_pressed():
	queue_free()


func _on_music_pressed():
	Globals.sound=!Globals.sound
	checkColor()


func _on_effect_pressed():
	Globals.sfx=!Globals.sfx
	checkColor()
