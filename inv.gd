extends Node2D


#declared member variables

var fullness = {
	
	'blocked': false,
	
	'LH': {
		'fullness': 'empty',
		'ispressed': false,
		'transform': {
			'Knife': ['']
		}
	},
	'RH': {
		'fullness': 'empty',
		'ispressed': false,
		'transform': {
			'Knife': ['']
		}
	}
}
	

func _transform(pros):
		if fullness['LH']['ispressed'] && fullness['LH']['transform'][pros['name']].has($LH/Lefthand.get_animation()+pros['name']):
			fullness['LH']['fullness']=fullness['LH']['fullness']+'Knife'
			$LH/Lefthand.set_animation(fullness['LH']['fullness'])
			fullness['LH']['ispressed']=false;
			$LH/frameLH.set_frame(fullness['LH']['ispressed'])
			
		else:
			if fullness['RH']['ispressed'] && fullness['RH']['transform'][pros['name']].has($RH/Righthand.get_animation()+pros['name']):
				fullness['RH']['fullness']=fullness['RH']['fullness']+'Knife'
				$RH/Righthand.set_animation(fullness['RH']['fullness'])
				fullness['RH']['ispressed']=false;
				$RH/frameRH.set_frame(fullness['RH']['ispressed'])
			

func _getter(pros):
	if fullness['LH']['fullness']=='empty' && fullness['LH']['ispressed'] :
			fullness['LH']['fullness']=pros['name']
			$"LH/Lefthand".set_animation(fullness['LH']['fullness'])
			fullness['LH']['ispressed']=false;
			$LH/frameLH.set_frame(fullness['LH']['ispressed'])
			fullness['LH']['transform']=pros['transform']
		
	else:
		if fullness['RH']['fullness']=='empty' && fullness['RH']['ispressed'] :
			fullness['RH']['fullness']=pros['name']
			$"RH/Righthand".set_animation(fullness['RH']['fullness'])
			fullness['RH']['ispressed']=false;
			$RH/frameRH.set_frame(fullness['RH']['ispressed'])
			fullness['RH']['transform']=pros['transform']
		else:
			if fullness['LH']['fullness']=='empty':
				fullness['LH']['fullness']=pros['name']
				$"LH/Lefthand".set_animation(fullness['LH']['fullness'])
				fullness['LH']['ispressed']=false;
				$RH/frameRH.set_frame(fullness['LH']['ispressed'])
				fullness['LH']['transform']=pros['transform']
			else:
				if fullness['RH']['fullness']=='empty':
					fullness['RH']['fullness']=pros['name']
					$"RH/Righthand".set_animation(fullness['RH']['fullness'])
					fullness['RH']['ispressed']=false;
					$RH/frameRH.set_frame(fullness['RH']['ispressed'])
					fullness['RH']['transform']=pros['transform']

#pressing on LH
func _on_LH_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed) && fullness['blocked']==false:
		fullness['LH']['ispressed']= not(fullness['LH']['ispressed'])
		$LH/frameLH.set_frame(fullness['LH']['ispressed'])
		if fullness['RH']['ispressed']:
			fullness['RH']['ispressed']= not(fullness['RH']['ispressed'])
			$RH/frameRH.set_frame(fullness['RH']['ispressed'])

#pressing on RH
func _on_RH_input_event(_viewport, event, _shape_idx):
	if (event is InputEventScreenTouch && event.pressed) && fullness['blocked']==false:
		fullness['RH']['ispressed']= not(fullness['RH']['ispressed'])
		$RH/frameRH.set_frame(fullness['RH']['ispressed'])
		if fullness['LH']['ispressed']:
			fullness['LH']['ispressed']= not(fullness['LH']['ispressed'])
			$LH/frameLH.set_frame(fullness['LH']['ispressed'])


#pressing on deleter
func _on_delete_delete():
	fullness = {
	
	'blocked': false,
	
	'LH': {
		'fullness': 'empty',
		'ispressed': false,
		'transform': ''
	},
	'RH': {
		'fullness': 'empty',
		'ispressed': false,
		'transform': ''
	}
}
	$LH/Lefthand.set_animation(fullness['LH']['fullness'])
	$LH/frameLH.set_frame(fullness['LH']['ispressed'])
	$RH/frameRH.set_frame(fullness['RH']['ispressed'])
	$RH/Righthand.set_animation(fullness['RH']['fullness'])

#cloathObject
func _on_Cloath_cloath(pros):
	_getter(pros)

#grasObject
func _on_gras_gras(pros ):
	_getter(pros)

#grasObject
func _on_glasses_glasses(pros):
	_getter(pros)

#onionObject
func _on_Onion_onion(pros):
	_getter(pros)

#saltObject
func _on_salt_salt(pros):
	_getter(pros)

#eggObject
func _on_eggs_eggs(pros):
	_getter(pros)

#skipObject
func _on_skipidar_skipidar(pros):
	_getter(pros)

#chainObject
func _on_chain_chain(pros):
	_getter(pros)

#igolkaObject
func _on_igolka_igolka(pros):
	_getter(pros)

#transformerKnife
func _on_Knife_knife(pros):
	_transform(pros)
