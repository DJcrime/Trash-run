extends Node

#Array scene spazzatura
var trashes:Array=Array(["res://characters/glass.tscn",
						"res://characters/glass.tscn",
						"res://characters/indifferenziata.tscn",
						"res://characters/plastic.tscn",
						"res://characters/umido.tscn"])
#variabili per muovere a destra o sinistra
var left:bool=false
var right:bool=false
var player
func _ready():
	var chara=Globals.chosenCharacter.instantiate()
	chara.position=Vector2(0,0)
	chara.scale=Vector2(3.4,3.4)
	$CanvasLayer/Control/Container.add_child(chara)
	player=$CanvasLayer/Control/Container.get_child(0)

func _process(delta):
	if left:
		player.position.x-=200*delta
	if right:
		player.position.x+=200*delta
	$trash.position.y+=100*delta
	if $deleteBarrier/VisibleOnScreenNotifier2D.is_on_screen():
		$deleteBarrier.position.y+=3
		Globals.deleteLimit=$deleteBarrier.position.y

func _on_left_button_down():
	right=false
	left=true


func _on_right_button_down():
	right=true
	left=false


func _on_right_button_up():
	right=false


func _on_left_button_up():
	left=false


func _on_trash_spawn_timeout():
	for i in range(2):
		var type=load(trashes.pick_random())
		var trash=type.instantiate()
		trash.position=Vector2(randi_range(20,1100),-$trash.position.y-randi_range(20,50))
		$trash.add_child(trash)
