extends fall

func process_input(event: InputEvent):
	if(Input.is_action_just_pressed("jump") && PlayerGlobals.jumpCount > 0):
		exit(canTransitionTo[2])
		PlayerGlobals.jumpCount -= 1
	
