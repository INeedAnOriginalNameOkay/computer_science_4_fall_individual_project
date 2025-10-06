class_name idle extends State
	
func process_input(event: InputEvent):
	if(event.is_action_pressed("jump")):
		exit(canTransitionTo[0])

func process(delta:float):
	if(!parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
	elif(Input.get_axis("ui_left", "ui_right") != 0):
		exit(canTransitionTo[2]);
	return null
