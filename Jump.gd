class_name jump extends State
	
func process_input(event: InputEvent):
	if(event.is_action_released("jump")):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	return null

func enter():
	parent.parent.velocity.y = -1000
	
func exit(newState: State):
	parent.parent.velocity.x = 0
	super(newState)
	
func process_physics(delta: float):
	parent.parent.velocity.x = move_speed*Input.get_axis("ui_left", "ui_right")
	parent.parent.velocity.y += gravity/2
	if(parent.parent.velocity.y >= gravity * 10):
		parent.parent.velocity.y = gravity * 10
	if parent.parent.velocity.y >= 0:
		exit(canTransitionTo[0])
