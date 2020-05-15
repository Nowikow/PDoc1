extends AnimatedSprite

func tik():
	$".".set_animation('tik')
	$".".get_node('Tik').stop()
	$".".get_node('Tik').play('tik')

func roll():
	yield(get_tree().create_timer(1.0), "timeout")
	$".".set_animation('roll')
	$".".get_node('Roll').stop()
	$".".get_node('Roll').play('roll')

