extends Area2D

signal chain

var pros = {
	'name': 'chainObject',
	'transform': {
		'Knife': ['']
	}
}
func _on_chain_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("chain", pros)
		$chainSound1.play()
		$chainSound2.play()



func _on_chain_mouse_entered():
	$Sprite.set_frame(1)


func _on_chain_mouse_exited():
	$Sprite.set_frame(0)
