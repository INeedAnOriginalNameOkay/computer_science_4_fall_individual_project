extends idle

func enter():
	PlayerGlobals.jumpCount = PlayerGlobals.maxJumpCount
	PlayerGlobals.x_velocity = 0
	PlayerGlobals.y_velocity = 0
	parent.parent.velocity.x = 0
	super()

func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[0])
		PlayerGlobals.jumpCount -= 1
	if(Input.is_action_just_pressed("light_attack")):
		exit(canTransitionTo[3])
	if(Input.get_axis("ui_left", "ui_right") != 0):
		exit(canTransitionTo[2])
		
func process(delta: float):
	super(delta)
