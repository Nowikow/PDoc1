extends Area2D

signal salt

var pros = {
	'name': 'saltObject',
	'transform': {
		'Knife': ['']
	}
}

func _on_salt_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("salt", pros)
		$saltSound.play()


func _on_salt_mouse_entered():
	$Sprite.set_frame(1)


func _on_salt_mouse_exited():
	$Sprite.set_frame(0)
