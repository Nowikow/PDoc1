extends Area2D

signal knife

var pros = {
	'name': 'Knife'
}

var sounds=['knifeSound1', 'knifeSound2']

func _on_Knife_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		emit_signal("knife", pros)
		get_node(sounds[randi()%2]).play()



func _on_Knife_mouse_entered():
	$Sprite.set_frame(1)


func _on_Knife_mouse_exited():
	$Sprite.set_frame(0)
