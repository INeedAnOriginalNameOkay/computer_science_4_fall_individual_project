extends Entity

func _process(delta:float):
	#print(statemach.state)
	super(delta)
	
func check_collisions(body):
	if body.is_in_group("Player Hitbox") && !invincible:
		statemach.transition(launch_state)
		invincible = true
		print(sqrt(abs(PlayerGlobals.launchVector.x+PlayerGlobals.launchVector.y))/50)
		i_frame_timer.start ( sqrt(abs(PlayerGlobals.launchVector.x+PlayerGlobals.launchVector.y))/100 ) 
		#ouchie wouchie
