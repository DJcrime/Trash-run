extends Area2D

var type:String="plastic"


func _on_area_entered(area):
	if area.is_in_group(type):
		area.queue_free()

