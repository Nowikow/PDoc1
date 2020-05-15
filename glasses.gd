extends Area2D

signal glasses

var pros = {
	'name': 'glassesObject',
	'transform': {
		'Knife': ['']
	}
}

func _on_glasses_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("glasses", pros)
		$glassesSound.play()
	pass 


func _on_glasses_mouse_entered():
	$Sprite.set_frame(1)


func _on_glasses_mouse_exited():
	$Sprite.set_frame(0)
