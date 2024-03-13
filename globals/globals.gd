extends Node
#segnali
signal checkVita
signal checkPunteggio
signal checkAnim
signal checkTrashValue
signal checkSound
#varibile personaggio selezionato
var chosenCharacter:PackedScene=preload("res://characters/player/base_character.tscn")
#variabile che indice l'altezza a cui la spazzatura viene eliminata
var deleteLimit:float
#varibile vite
var vite:int=0:
	set(value):
		vite=value
		trashValue=100
		checkVita.emit()
#variabili per fermare
var gameOver:bool=false
var pause:bool=false
#variabili punteggio
var score:int=0:
	set(value):
		score=value
		if score>best:
			best=score
		checkPunteggio.emit()

var best:int=0:
	set(value):
		best=value
		save_variables("score","best",best)
#variabile per le animazioni di movimento
var anim:int=0:
	set(value):
		anim=value
		checkAnim.emit()
#variabile valore sporcizia
var trashValue:float=100:
	set(value):
		trashValue=value
		checkTrashValue.emit()

#variabili musica e effetti
var sound:bool=true:
	set(value):
		sound=value
		checkSound.emit()
		save_variables("imp","sound",sound)

var sfx:bool=true:
	set(value):
		sfx=value
		save_variables("imp","sfx",sfx)

#variabile per salvataggio
var config = ConfigFile.new()

#!!FUNZIONI SALVATAGGIO!!
func save_variables(section: String,variableName:String,variableValue: Variant):
	
	config.set_value(section, variableName, variableValue)
	config.save("user://config.cfg")

# Caricamento delle variabili
func load_variables(section: String,variableName:String)->Variant:
	var variableValue:Variant
	if config.load("user://config.cfg") == OK:
		variableValue = config.get_value(section, variableName)
	return variableValue

func _ready():#load di tutte le variabili salvate
	if load_variables("score","best")!=null:
		best=load_variables("score","best")#best score
	if load_variables("imp","sound")!=null:
		sound=load_variables("imp","sound")#impostazione sound
	if load_variables("imp","sfx")!=null:
		sfx=load_variables("imp","sfx")#impostazione effetti
