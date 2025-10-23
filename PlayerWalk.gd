extends walk

func enter():
	PlayerGlobals.jumpCount = PlayerGlobals.maxJumpCount
	super()
	
	
func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[0])
		PlayerGlobals.jumpCount -= 1
	
	elif (Input.get_axis("ui_left", "ui_right") == 0):
		exit(canTransitionTo[2])
		
	
func process(delta:float):
	if (Input.get_axis("ui_left", "ui_right") == -1):
		parent.parent.animations.flip_h = true
		
	elif (Input.get_axis("ui_left", "ui_right") == 1):
		parent.parent.animations.flip_h = false
		
	super(delta)

func fall_speed(modifier: float, weight: float):
	PlayerGlobals.fall_speed(modifier, weight)
	parent.parent.velocity.y = PlayerGlobals.y_velocity
		
func horizontal_speed(modifier: float):
	PlayerGlobals.horizontal_speed(modifier)
	parent.parent.velocity.x = PlayerGlobals.x_velocity
	
