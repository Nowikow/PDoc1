extends Area2D

export var sick= 'empty'

signal checky


func _on_Peasant_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed):
		var peasant= get_node('.')
		emit_signal('checky', peasant)

func _on_exit_animation_finished(_anim_name):
	queue_free()


func _on_enter_animation_finished(_anim_name):
	$AnimatedSprite.set_animation('idle'+$AnimatedSprite.get_animation())


func _on_exit_head_animation_finished(_anim_name):
	queue_free()


func _on_enter_head_animation_finished(_anim_name):
	$AnimatedSprite.set_animation('vhead_stay')
