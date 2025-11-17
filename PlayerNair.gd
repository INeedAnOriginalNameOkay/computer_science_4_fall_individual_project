extends PlayerAttackState

func process_physics(delta:float):
	fall_speed(1,weight)
	horizontal_speed(0.5)
	super(delta)
	
func fall_speed(modifier: float, weight: float):
	PlayerGlobals.fall_speed(modifier, weight)
	parent.parent.velocity.y = PlayerGlobals.y_velocity
		
func horizontal_speed(modifier: float):
	PlayerGlobals.horizontal_speed(modifier)
	parent.parent.velocity.x = PlayerGlobals.x_velocity
	if(EnemyStuff.ult):
		if(parent.parent.position.x > 576):
			parent.parent.velocity.x -= 50
		elif(parent.parent.position.x < 576):
			parent.parent.velocity.x += 50
