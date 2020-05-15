extends Node

func _on_ButtonEM_pressed():
	$ButtonEM/EMSprite.set_frame(2)
	$ButtonEM/ButtonPressed.play()
	Global.Tutor=false
	get_tree().change_scene("res://main.tscn")

func _on_ButtonEM_mouse_entered():
	$ButtonEM/EMSprite.set_frame(1)
	$ButtonEM/ButtonHovered.play()

func _on_ButtonEM_mouse_exited():
	$ButtonEM/EMSprite.set_frame(0)


func _on_ButtonNG_mouse_entered():
  $ButtonEM/ButtonHovered.play()

func _on_ButtonNG_pressed():
	$ButtonEM/ButtonPressed.play()
	Global.Tutor=true
	get_tree().change_scene("res://Prologue.tscn")
