extends launched

func enter():
	_start_launch(EnemyStuff.LaunchedVector)
	parent.play_anim(animation_name)

func process_physics(delta:float):
	super(delta)

func exit(newState: State):
	if(EnemyStuff.phase == 1 && EnemyStuff.hp <= 500):
		super(canTransitionTo[2])
		EnemyStuff.phase = 2
	else:
		super(newState)
		
func fall_speed(modifier: float, weight: float): 
	parent.parent.velocity.y += gravity *  weight * modifier
	if(parent.parent.velocity.y >= gravity * weight * 15):
		parent.parent.velocity.y = gravity * weight * 15
