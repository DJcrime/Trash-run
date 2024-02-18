extends Area2D

func _process(_delta):
	if global_position.y>Globals.deleteLimit:
		queue_free()
