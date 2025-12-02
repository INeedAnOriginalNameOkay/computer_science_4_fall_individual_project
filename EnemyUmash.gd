extends AttackState

func enter():
	EnemyStuff.EnemyLaunchVector = attacks.data.knockback
	if(parent.parent.animations.flip_h == true):
		EnemyStuff.EnemyLaunchVector.x = 0 - EnemyStuff.EnemyLaunchVector.x
	EnemyStuff.dmg = attacks.damage
	super()

func exit(newState:State):
	EnemyStuff.dmg = 0
	if(randi_range(1,5) <5):
		super(canTransitionTo[2])
		return
	super(newState)
