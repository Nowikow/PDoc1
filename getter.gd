extends Area2D

signal give

func _on_getter_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("give")
	pass 
