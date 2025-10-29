extends jump
	
func enter():
	PlayerGlobals.y_velocity = 0 - PlayerGlobals.jumpPower
	
func process_input(event: InputEvent):
	if(event.is_action_released("jump")):
		PlayerGlobals.y_velocity = 0
		exit(canTransitionTo[0])

func exit(newState: State):
	if(PlayerGlobals.y_velocity > 0):
		PlayerGlobals.y_velocity = 0
	super(newState)
		
func fall_speed(modifier: float, weight: float):
	PlayerGlobals.fall_speed(modifier, weight)
	parent.parent.velocity.y = PlayerGlobals.y_velocity
		
func horizontal_speed(modifier: float):
	PlayerGlobals.horizontal_speed(modifier)
	parent.parent.velocity.x = PlayerGlobals.x_velocity
	
