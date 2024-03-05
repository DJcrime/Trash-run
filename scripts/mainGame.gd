extends Node

#Array scene spazzatura
var trashes:Array=Array(["res://characters/glass.tscn",
						"res://characters/carton.tscn",
						"res://characters/indifferenziata.tscn",
						"res://characters/plastic.tscn",
						"res://characters/umido.tscn"])
#menu pausa
const PAUSE_MENU = preload("res://scenes/pause_menu.tscn")
#variabili per muovere a destra o sinistra
var left:bool=false
var right:bool=false
var player
func _ready():
	Globals.vite=0
	Globals.connect("checkVita",checkVita)
	Globals.connect("checkPunteggio",checkPunteggio)
	var chara=Globals.chosenCharacter.instantiate()
	chara.position=Vector2(0,0)
	chara.scale=Vector2(3.4,3.4)
	$CanvasLayer/Control/Container.add_child(chara)
	player=$CanvasLayer/Control/Container.get_child(0)

func _process(delta):
	if (!Globals.gameOver and !Globals.pause):
		if left:
			player.position.x-=200*delta
		if right:
			player.position.x+=200*delta
		$trash.position.y+=150*delta
		if $deleteBarrier/VisibleOnScreenNotifier2D.is_on_screen():
			$deleteBarrier.position.y+=3
			Globals.deleteLimit=$deleteBarrier.position.y

func checkVita():
	if(!Globals.gameOver and !Globals.pause):
		if Globals.vite!=0:
			var postits=$corkboardPostit.get_children()
			postits[Globals.vite].texture=preload("res://grafiche/scenes/postitcompleted.png")
		if Globals.vite==3:
			Globals.gameOver=true
			$"CanvasLayer/Control/gameover screen".visible=true
			

func checkPunteggio():
	$CanvasLayer/Control/score.text=str(Globals.score)

func _on_left_button_down():
	Globals.anim=2
	right=false
	left=true


func _on_right_button_down():
	Globals.anim=1
	right=true
	left=false


func _on_right_button_up():
	Globals.anim=0
	right=false


func _on_left_button_up():
	Globals.anim=0
	left=false


func _on_trash_spawn_timeout():
	if (!Globals.gameOver and !Globals.pause):
		for i in range(2):
			var type=load(trashes.pick_random())
			var trash=type.instantiate()
			trash.position=Vector2(randi_range(20,$CanvasLayer/Control/TextureRect.global_position.x+20),-$trash.position.y-randi_range(20,50))
			$trash.add_child(trash)


func _on_pause_pressed():
	Globals.pause=true
	$CanvasLayer/Control/left.visible=false
	$CanvasLayer/Control/right.visible=false
	var pause=PAUSE_MENU.instantiate()
	$CanvasLayer/Control/pauseMenu.add_child(pause)


func _on_pause_menu_child_exiting_tree(_node):
	$CanvasLayer/Control/left.visible=true
	$CanvasLayer/Control/right.visible=true
	Globals.pause=false


func _on_down_value_timeout():
	if (!Globals.gameOver and !Globals.pause):
		if Globals.trashValue>0:
			Globals.trashValue-=0.05
		else:
			Globals.vite+=1
