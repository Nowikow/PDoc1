extends Area2D

signal igolka

var pros = {
	'name': 'igolkaObject',
	'transform': {
		'Knife': ['']
	}
}

func _on_igolka_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("igolka", pros)
		$igSound.play()



func _on_igolka_mouse_entered():
	$Sprite.set_frame(1)


func _on_igolka_mouse_exited():
	$Sprite.set_frame(0)
