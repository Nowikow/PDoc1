extends Area2D

signal skipidar

var pros = {
	'name': 'skipObject',
	'transform': {
		'Knife': ['']
	}
}

func _on_skipidar_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("skipidar", pros)
		$skipSound.play()



func _on_skipidar_mouse_entered():
	$Sprite.set_frame(1)


func _on_skipidar_mouse_exited():
	$Sprite.set_frame(0)
