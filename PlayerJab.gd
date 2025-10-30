extends PlayerAttackState

func enter():
	super()

func process_input(event:InputEvent):
	super(event)
	if(Input.is_action_just_pressed("jump") && Input.is_action_just_pressed("light_attack")):
		PlayerGlobals.y_velocity = PlayerGlobals.jumpPower
		exit(canTransitionTo[2])
