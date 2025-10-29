extends Entity

func _process(delta:float):
	#print(statemach.state)
	super(delta)
	
func check_collisions(body):
	if body.is_in_group("Player Hitbox") && !invincible:
		print("ouchie!")
		statemach.transition(launch_state)
		invincible = true
		i_frame_timer.start()
		#ouchie wouchie
