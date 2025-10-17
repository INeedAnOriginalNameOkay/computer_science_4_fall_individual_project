extends jump
	
func enter():
	parent.parent.velocity.y = 0 - PlayerGlobals.jumpPower
	
func process_input(event: InputEvent):
	if(event.is_action_released("jump")):
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
	if(Input.is_action_just_pressed("ui_focus_next")):
		exit(canTransitionTo[2])
