extends idle

func enter():
	parent.parent.velocity.x = 0
	super()
	
func process_physics(delta:float):
	super(delta)

	if(parent.parent.position.x < PlayerGlobals.pos.x):
		parent.parent.animations.flip_h = false
	else:
		parent.parent.animations.flip_h = true
		
	if(parent.parent.position.distance_to(PlayerGlobals.pos) > 90):
		exit(canTransitionTo[2])
	elif (parent.parent as enemy ).canAttack:
		EnemyStuff.combo = randi_range(1,5)
		(parent.parent as enemy ).canAttack = false
		(parent.parent as enemy ).TBATimer.start(randf_range(0,0.5))
		exit(canTransitionTo[EnemyStuff.combo + 2])
		
