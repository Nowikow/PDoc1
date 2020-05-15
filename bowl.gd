extends Area2D

signal bowl

func _on_bowl_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("bowl")
		$bowlSound.play()



func _on_bowl_mouse_entered():
	$Sprite.set_frame(1)


func _on_bowl_mouse_exited():
	$Sprite.set_frame(0)
