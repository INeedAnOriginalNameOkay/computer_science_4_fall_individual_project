class_name fall extends State
	
func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[1])
		PlayerGlobals.jumpCount -= 1
		
func process(delta: float):
	if(parent.parent.is_on_floor()):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	return null

func exit(newState:State):
	parent.parent.velocity.y = 0
	parent.parent.velocity.x = 0
	super(newState)
	
func process_physics(delta: float):
	horizontal_speed(1)
	fall_speed(1)
