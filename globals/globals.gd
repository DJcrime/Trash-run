extends Node
#segnali
signal checkVita
signal checkPunteggio
signal checkAnim
#varibile personaggio selezionato
var chosenCharacter:PackedScene=preload("res://characters/player/paper_trash.tscn")
#variabile che indice l'altezza a cui la spazzatura viene eliminata
var deleteLimit:float
#varibile vite
var vite:int=0:
	set(value):
		vite=value
		checkVita.emit()
#variabili per fermare
var gameOver:bool=false
var pause:bool=false
#variabile punteggio
var score:int=0:
	set(value):
		score=value
		checkPunteggio.emit()
#variabile per le animazioni di movimento
var anim:int=0:
	set(value):
		anim=value
		checkAnim.emit()

