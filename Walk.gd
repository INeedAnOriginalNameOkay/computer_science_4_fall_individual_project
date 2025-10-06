class_name walk extends State
	
func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[1])
		PlayerGlobals.jumpCount -= 1
		
	elif(!parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
	
	elif (Input.get_axis("ui_left", "ui_right") == 0):
		exit(canTransitionTo[2])
	return null

func exit(newState: State):
	parent.parent.velocity.x = 0
	super(newState)

func process_physics(delta:float):
	horizontal_speed(1)
