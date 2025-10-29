extends launched

func enter():
	_start_launch(PlayerGlobals.launchVector)
	parent.play_anim(animation_name)

func fall_speed(modifier: float, weight: float): 
	parent.parent.velocity.y += gravity *  weight * modifier
	if(parent.parent.velocity.y >= gravity * weight * 15):
		parent.parent.velocity.y = gravity * weight * 15
	
func horizontal_speed(modifier: float):
	var deltax = (PlayerGlobals.move_speed) * (PlayerGlobals.grip / 5) * modifier
		
	if(Input.is_action_pressed("ui_left")):
		parent.parent.velocity.x -= deltax
		if(abs(parent.parent.velocity.x) > PlayerGlobals.move_speed):
			parent.parent.velocity.x = 0 - PlayerGlobals.move_speed
		
	elif(Input.is_action_pressed("ui_right")):
		parent.parent.velocity.x += deltax
		if(abs(parent.parent.velocity.x) > PlayerGlobals.move_speed):
			parent.parent.velocity.x = PlayerGlobals.move_speed
