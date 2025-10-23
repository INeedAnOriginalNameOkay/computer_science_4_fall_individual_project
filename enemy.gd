extends Entity

func _process(delta:float):
	super(delta)
	print(statemach.state)
	
func check_collisions(body):
	if body.is_in_group("Player Hitbox"):
		pass
		#ouchie wouchie
