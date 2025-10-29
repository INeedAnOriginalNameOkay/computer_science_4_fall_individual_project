extends Entity

func _process(delta:float):
	pass
	
func check_collisions(body):
	if body.is_in_group("Enemy Hitbox") :
		pass
		#ouchie wouchie
