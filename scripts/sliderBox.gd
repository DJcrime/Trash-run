extends ColorRect

func _process(_delta):
	if global_position.x<-2304:
		global_position.x=2304
	if global_position.x>2304:
		global_position.x=-2304
