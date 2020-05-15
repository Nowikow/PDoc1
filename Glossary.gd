extends Node2D

signal press

var sounds= ['flipPage1', 'flipPage2', 'flipPage3']

func _ready():
	if(not visible):
		deactivate()

func deactivate():
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
func activate():
	show()
	set_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
	
func _on_ButtonGlossary_pressed():
	activate()
	emit_signal('press')
	

func _on_ButtonMenu_pressed():
	$ButtonPressed.play()
	$Popup.popup()

func _on_ButtonMenu_mouse_entered():
	$ButtonHovered.play()

func _on_ButtonBack_pressed():
	$ButtonPressed.play()
	deactivate()

func _on_ButtonRecipes_pressed():
	$ButtonPressed.play()
	$BookPages.set_frame(0)

func _on_ButtonBack_mouse_entered():
	$ButtonHovered.play()

func _on_ButtonRecipes_mouse_entered():
	$ButtonHovered.play()


func _on_ButtonFlipPageRight_pressed():
	$BookPages.set_frame($BookPages.get_frame()+1)
	get_node(sounds[randi()%3]).play()


func _on_ButoonFlipPageLeft_pressed():
	$BookPages.set_frame($BookPages.get_frame()-1)
	get_node(sounds[randi()%3]).play()


