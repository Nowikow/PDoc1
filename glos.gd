extends Area2D

signal glos

func _on_Glos_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("glos")



func _on_Glos_mouse_entered():
	$Sprite.set_frame(1)


func _on_Glos_mouse_exited():
	$Sprite.set_frame(0)
