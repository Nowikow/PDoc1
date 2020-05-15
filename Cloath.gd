extends Area2D

signal cloath

var pros = {
	'name': 'cloathObject',
	'transform': {
		'Knife': ['cloathObjectKnife']
	}
}


func _on_Cloath_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("cloath", pros)
		$cloathSound.play()


func _on_Cloath_mouse_entered():
	$Sprite.set_frame(1)


func _on_Cloath_mouse_exited():
	$Sprite.set_frame(0)
