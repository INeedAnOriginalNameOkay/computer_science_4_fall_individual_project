extends wallcling

func enter():
	PlayerGlobals.x_velocity = 0
	PlayerGlobals.y_velocity = 0
	super()
	
func process_input(event: InputEvent):
	if(Input.is_action_pressed("jump")):
		parent.parent.velocity.x = PlayerGlobals.move_speed * (direction)
		exit(canTransitionTo[1])
		
func exit(newState: State):
	super(newState)
