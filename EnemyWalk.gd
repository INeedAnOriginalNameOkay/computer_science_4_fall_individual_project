extends walk

func horizontal_speed(mod: float):
	parent.parent.velocity.x = 300 * (PlayerGlobals.pos.x - parent.parent.position.x)/abs(PlayerGlobals.pos.x - parent.parent.position.x)

func process_physics(delta:float):
	super(delta)
	if(parent.parent.velocity.x > 0):
		parent.parent.animations.flip_h = false
	else:
		parent.parent.animations.flip_h = true
	if(parent.parent.position.distance_to(PlayerGlobals.pos) < 100):
		exit(canTransitionTo[0])
