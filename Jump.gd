class_name jump extends State
	
func process_input(event: InputEvent):
	if(event.is_action_released("jump")):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	return null

func enter():
	parent.parent.velocity.y = 0 - PlayerGlobals.jumpPower
	
func exit(newState: State):
	parent.parent.velocity.x = 0
	super(newState)
	
func process_physics(delta: float):
	horizontal_speed(1)
	fall_speed(1)
	if parent.parent.velocity.y >= 0:
		exit(canTransitionTo[0])
