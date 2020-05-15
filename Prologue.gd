extends Node2D


func _on_TextureButton_pressed():
	$ButtonPressed.play()
	get_tree().change_scene("res://main.tscn")

func _on_TextureButton_mouse_entered():
	$ButtonHovered.play()
