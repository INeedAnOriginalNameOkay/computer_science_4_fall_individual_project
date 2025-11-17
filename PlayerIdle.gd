extends idle

func enter():
	PlayerGlobals.jumpCount = PlayerGlobals.maxJumpCount
	PlayerGlobals.x_velocity = 0
	PlayerGlobals.y_velocity = 0
	parent.parent.velocity.x = 0
	super()

func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		PlayerGlobals.jumpCount -= 1
		if(Input.is_action_just_pressed("light_attack") || Input.is_action_just_pressed("heavy_attack")):
			PlayerGlobals.y_velocity = -PlayerGlobals.jumpPower/2
			exit(canTransitionTo[4])
			return
		exit(canTransitionTo[0])
		
	elif(Input.is_action_just_pressed("light_attack")):
		if(Input.is_action_pressed("ui_down")):
			exit(canTransitionTo[6])
		else:
			exit(canTransitionTo[3])
	elif(Input.is_action_just_pressed("heavy_attack")):
		exit(canTransitionTo[5])
	
func process_physics(delta:float):
	horizontal_speed(1)
	if(Input.get_axis("ui_left", "ui_right") != 0):
		exit(canTransitionTo[2])
	super(delta)

func horizontal_speed(modifier: float):
	PlayerGlobals.horizontal_speed(modifier)
	parent.parent.velocity.x = PlayerGlobals.x_velocity
	if(EnemyStuff.ult):
		if(parent.parent.position.x > 576):
			parent.parent.velocity.x -= 175
		elif(parent.parent.position.x < 576):
			parent.parent.velocity.x += 175
