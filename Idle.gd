class_name idle extends State
	
func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[0])
		PlayerGlobals.jumpCount -= 1
		
func enter():
	PlayerGlobals.jumpCount = PlayerGlobals.maxJumpCount
	super()
	
func process(delta:float):
	if(!parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
	elif(Input.get_axis("ui_left", "ui_right") != 0):
		exit(canTransitionTo[2]);
	return null
