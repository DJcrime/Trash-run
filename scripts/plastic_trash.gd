extends Area2D

var type:String="plastic"


func _on_area_entered(area):
	if (!Globals.gameOver&&!Globals.pause):
		if area.is_in_group(type):
			area.queue_free()
			Globals.score+=1
			if Globals.trashValue<=70:
				Globals.trashValue+=30
			else:
				Globals.trashValue=100
		else:
			Globals.vite+=1
			area.queue_free()

