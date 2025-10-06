class_name fall extends State
	
func process_input(event: InputEvent):
	if(parent.parent.is_on_floor()):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	return null

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
	parent.parent.velocity.x = move_speed*Input.get_axis("ui_left", "ui_right")
	parent.parent.velocity.y += gravity/2
