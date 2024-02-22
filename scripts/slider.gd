extends Control






func _on_button_left_pressed():
	$Control.position=$Control.position-Vector2(1152,0)


func _on_button_right_pressed():
	$Control.position=$Control.position-Vector2(-1152,0)
