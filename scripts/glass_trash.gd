extends Area2D

var type:String="glass"


func _on_area_entered(area):
	if (!Globals.gameOver&&!Globals.pause):
		if area.is_in_group(type):
			area.queue_free()
			Globals.score+=1
		else:
			Globals.vite+=1
			area.queue_free()
