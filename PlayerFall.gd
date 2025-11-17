extends fall

func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[1])
		PlayerGlobals.jumpCount -= 1
	elif(Input.is_action_just_pressed("light_attack")):
				exit(canTransitionTo[3])

func process(delta:float):
	if (Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")) != 0 && parent.parent.is_on_floor():
		exit(canTransitionTo[2])
		return
	super(delta)

func fall_speed(modifier: float, weight: float):
	PlayerGlobals.fall_speed(modifier, weight)
	parent.parent.velocity.y = PlayerGlobals.y_velocity
		
func horizontal_speed(modifier: float):
	PlayerGlobals.horizontal_speed(modifier)
	parent.parent.velocity.x = PlayerGlobals.x_velocity
	if(EnemyStuff.ult):
		if(parent.parent.position.x > 576):
			parent.parent.velocity.x -= 175
		elif(parent.parent.position.x < 576):
			parent.parent.velocity.x += 175
	
