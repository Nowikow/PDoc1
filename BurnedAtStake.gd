extends Node2D


func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
		$ButtonPressed.play()
		get_tree().change_scene("res://StartMenu.tscn")

func _on_ButtonHome_mouse_entered():
	$ButtonHovered.play()
