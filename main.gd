extends Node2D

signal printText

signal printTutText


func play_sample():
	$GoodMorningKnock.play()
	$GoodMorningBlalbla.play()

export (PackedScene) var Peasant
var Show= preload("res://finger.tscn")

var treatment= {
	'healthy': ['glassesObject', 'empty'],
	'padagra': ['grasObjectKnife', 'cloathObjectKnife'],
	'necrosis': ['chainObject', 'cloathObjectKnife'],
	'burns': ['onionObjectKnife', 'saltObject'],
	'open_cut': ['eggObjectKnife', 'skipObject']
}

var dialogs = {
	'burns': ['Fell down in the fire', 'Slept under the sun', 'Tried to make fire, but fired myself'],
	'necrosis': ['look at my finger! It is black', 'Just cuted my finger. Is it ok?'],
	'padagra': ['My bones are in pain', 'Found big bud on my knee', 'My finger was hurted. Now it is better, but i dont feel my leg...'],
	'healthy': ['Ye, man, I am ok', 'I thought, I am diying', 'Treat me! Now!'],
	'open_cut': ['Decided to straight my moustache, but the razor cuted my hand', 'I found a nail in myself!']
}

var illGenerator=['padagra', 'healthy', 'necrosis', 'burns', 'open_cut'] 

var tutText=[
	'Good day, my friend. I am the Head of this village',
	'Today is Your first day. Lots of people, lots of problems',
	'We talked about them yesterday. Also You made some notes',
	#
	'Is it our first poor man? I will call him now and help you with treatment',
	'JEAAAAAAAN!',
	#
	'I do not understand what happened. Let us inspect him',
	'The glasses are on the table',
	#
	'I am so tired...',
	'Shame on you! You go keep your eyes on sheeps! Do not disturb us!',
	#
	'Sometimes they just do not want to work',
	'Why are you still holding this? Throw it out',
	#
	'Villagers only come to You as a last resort',
	'Please, treat them as fast as you can',
	'That is all, I think. Good luck at your first day',
	]

var count=0
var sick= 0
var fail= 0
var tutor=Global.Tutor
var victory=0
var deaths=0

var soundTalk = ['voice_talk1', 'voice_talk2', 'voice_talk3', 'voice_talk4', 'voice_talk5', 'voice_talk6']
var soundDeath = ['deathTalk1', 'deathTalk2']

func _ready():
	if tutor == true:
		tutorial()
	else:
		yield(get_tree().create_timer(4.0), "timeout")
		var text=' '
		emit_signal("printTutText", text)
		$inv.fullness['blocked']=false
		var peasant= Peasant.instance()
		_appear(peasant)

func tutorial():
	var peasant=Peasant.instance()
	$TutorialPosition.add_child(peasant)
	peasant.get_node('enter_head').play('enter_head')
	peasant.get_node('AnimatedSprite').animation='vhead_walk'
	$tutTimer.start(7)

func _appear(peasant):
	$deathTimer.start(24)
	$Clock.tik()
	peasant.get_node('AnimatedSprite').set_animation(illGenerator[randi() % illGenerator.size()])
	$SpawnPosition.add_child(peasant)
	peasant.sick=peasant.get_node('AnimatedSprite').get_animation()
	sick=peasant.sick
	peasant.get_node('enter').play('enter')
	peasant.connect("checky", $".", '_treat')

func _treat(peasant):
	
	if ($inv/LH/Lefthand.get_animation()==treatment[sick][0] && $inv/RH/Righthand.get_animation()==treatment[sick][1]) || ($inv/LH/Lefthand.get_animation()==treatment[sick][1] && $inv/RH/Righthand.get_animation()==treatment[sick][0]):
		peasant.get_node('voice_health').play()
		peasant.get_node('success').play()
		peasant.get_node('AnimatedSprite').set_animation('healthy')
		peasant.get_node('AnimatedSprite').set_flip_h(true)
		peasant.get_node('exit').play('exit')
		$deathTimer.stop()
		$Clock.roll()
		$nextPatientTimer.start()
		victory+=1
		
	else: 
		if ($inv/LH/Lefthand.get_animation()=='glassesObject' && $inv/RH/Righthand.get_animation()=='empty') || ($inv/LH/Lefthand.get_animation()=='empty' && $inv/RH/Righthand.get_animation()=='glassesObject'):
			var monolog=dialogs[peasant.sick][randi() %2]
			peasant.get_node(soundTalk[randi()%6]).play()
			emit_signal("printText", monolog)
			yield(get_tree().create_timer(7.0), "timeout")
			var text=' '
			emit_signal("printTutText", text)
		else:
			if ($inv/LH/Lefthand.get_animation()=='empty' && $inv/RH/Righthand.get_animation()=='empty'):
				peasant.get_node(soundTalk[randi()%6]).play()
			else:
				peasant.get_node('fail').play()
				fail=fail+1
				if fail>=3:
					_death(peasant)
					deaths+=1
				

func _death(peasant):
	$deathTimer.stop()
	$Clock.roll()
	peasant.get_node('AnimatedSprite').	set_animation(sick+'Death')
	peasant.get_node('fallTalk').play()
	peasant.get_node(soundDeath[randi()%2]).play()
	$endTimer.start(2)

func _on_nextPatientTimer_timeout():
	if victory==10 && tutor:
		 get_tree().change_scene("res://Statistics.tscn")
	else:
		if deaths==5:
			get_tree().change_scene("res://BurnedAtStake.tscn")
	$GoodMorningKnock.play()
	fail= 0
	var peasant=Peasant.instance()
	_appear(peasant)


func _on_endTimer_timeout():
	$SpawnPosition.get_child(0).queue_free()
	$nextPatientTimer.start()


func _on_deathTimer_timeout():
	_death($SpawnPosition.get_child(0))


func _on_tutTimer_timeout():
	emit_signal("printTutText", tutText[count])
	count=count+1
	if count==3:
		var show=Show.instance()
		$ShowPosition.position.x=448.694
		$ShowPosition.position.y=56.915
		$ShowPosition.add_child(show)
	else:
		if count==5:
			$TutorialPosition.get_child(0).get_node('AnimatedSprite').set_flip_h(true)
			var peasant=Peasant.instance()
			$SpawnPosition.add_child(peasant)
			peasant.get_node('AnimatedSprite').set_animation('healthy')
			peasant.get_node('enter').play('enter')
			$tutTimer.start(8)
			peasant.connect("checky", $".", '_treatTut')
		else:
			if count==7:
				var show=Show.instance()
				$inv.fullness['blocked']=false
				$ShowPosition.position.x=253.534
				$ShowPosition.position.y=285.395
				$ShowPosition.add_child(show)
			else:
				if count==11:
					var show=Show.instance()
					$ShowPosition.position.x=731.518
					$ShowPosition.position.y=518.319
					$ShowPosition.add_child(show)
				else:
					if count==14:
						$TutorialPosition.get_child(0).get_node('AnimatedSprite').set_animation('vhead_walk')
						$TutorialPosition.get_child(0).get_node('exit_head').play('exit_head')
						yield(get_tree().create_timer(5.0), "timeout")
						var text=' '
						emit_signal("printTutText", text)
						$nextPatientTimer.start(6)
					else: 
						$tutTimer.start(8.2)


func _on_Glossary_press():
	if tutor && count==3:
		$ShowPosition.position.x=423.308
		$ShowPosition.position.y=566.237


func _on_Glossary_hide():
	if tutor && count==3:
		$ShowPosition.get_child(0).queue_free()
		$tutTimer.start(2)


func _on_glasses_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed) && tutor==true && count==7:
		$ShowPosition.position.x=-230.495
		$ShowPosition.position.y=421.849

func _treatTut(_peasant):
	if tutor==true && count==7 && ($inv/LH/Lefthand.get_animation()=='glassesObject' or $inv/RH/Righthand.get_animation()=='glassesObject'):
		$ShowPosition.get_child(0).queue_free()
		$SpawnPosition.get_child(0).get_node('AnimatedSprite').set_flip_h(true)
		$SpawnPosition.get_child(0).get_node('AnimatedSprite').set_animation('healthy')
		$SpawnPosition.get_child(0).get_node('exit').play('exit')
		$inv.fullness['blocked']=true
		$tutTimer.start(1)
		


func _on_delete_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed) && tutor==true && count==11:
		$ShowPosition.get_child(0).queue_free()
		$tutTimer.start(1)


func _on_ButtonGlossary_pressed():
	$ButtonGlossary/buttonBookSound.play()

func _on_yes_pressed():
	get_tree().change_scene("res://StartMenu.tscn")


func _on_no_pressed():
	$Glossary/Popup.hide()


func _on_tikTimer_timeout():
	$Clock.tik()
	$tikTimer.start(3)
