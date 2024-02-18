extends Node

#scene
const GLASS = preload("res://characters/glass.tscn")
#variabili per muovere a destra o sinistra
var left:bool=false
var right:bool=false

func _process(delta):
	if left:
		$"CanvasLayer/Control/Container/base character".position.x-=200*delta
	if right:
		$"CanvasLayer/Control/Container/base character".position.x+=200*delta
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
		var trash=GLASS.instantiate()
		trash.position=Vector2(randi_range(20,1100),-$trash.position.y-randi_range(20,50))
		$trash.add_child(trash)
