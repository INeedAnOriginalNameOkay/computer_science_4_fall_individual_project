class_name fall extends State
	
func process(delta: float):
	if(parent.parent.is_on_floor()):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	return null

func exit(newState:State):
	parent.parent.velocity.y = 0
	super(newState)
	
func process_physics(delta: float):
	horizontal_speed(.5)
	fall_speed(1,weight)
	if(parent.parent.is_on_wall()):
		exit(canTransitionTo[1])
