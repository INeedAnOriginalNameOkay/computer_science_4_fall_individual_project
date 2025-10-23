class_name PlayerAttack extends attack

func collisions(collided):
	if collided.is_in_group("Enemy Hurtbox"):
		pass
