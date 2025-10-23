class_name idle extends State

func enter():
	super()
	
func process(delta:float):
	if(!parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
		return
		
