class_name walk extends State

func exit(newState: State):
	super(newState)
	
func process(delta:float):
	pass
	
func process_physics(delta:float):
	horizontal_speed(1)
	if(!parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
