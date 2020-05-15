extends Area2D

signal eggs

var pros = {
	'name': 'eggObject',
	'transform': {
		'Knife': ['eggObjectKnife']
	}
}

func _on_eggs_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("eggs", pros)
		$eggSound.play()



func _on_eggs_mouse_entered():
	$Sprite.set_frame(1)


func _on_eggs_mouse_exited():
	$Sprite.set_frame(0)
