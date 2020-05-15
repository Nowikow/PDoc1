extends Area2D

signal onion

var pros = {
	'name': 'onionObject',
	'transform': {
		'Knife': ['onionObjectKnife']
	}
}

func _on_Onion_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("onion", pros)
		$onionSound.play()


func _on_Onion_mouse_entered():
	$onionSprite.set_frame(1)


func _on_Onion_mouse_exited():
	$onionSprite.set_frame(0)
