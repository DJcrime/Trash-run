extends Area2D

var type:String="umido"
var oldPos=position

func _ready():
	Globals.connect("checkAnim",checkAnim)

func checkAnim():
	if Globals.anim==0:
		$AnimationPlayer2.stop()
		$AnimationPlayer2.play("RESET")
	if Globals.anim==1:
		$AnimationPlayer2.stop()
		$AnimationPlayer2.play("walkRight")
	if Globals.anim==2:
		$AnimationPlayer2.stop()
		$AnimationPlayer2.play("walkLeft")

func _on_area_entered(area):
	if (!Globals.gameOver&&!Globals.pause):
		if area.is_in_group(type):
			area.queue_free()
			Globals.score+=1
		else:
			Globals.vite+=1
			area.queue_free()
