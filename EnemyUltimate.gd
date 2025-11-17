extends AttackState

@export var ultimate: Timer
var inUlt: bool
func enter():
	super()
	attacks.enter()
	timer.start(attacks.data.forswing + attacks.data.duration + attacks.backswing)
	inUlt = true
	EnemyStuff.ult = true
	EnemyStuff.dmg = attacks.damage
	ultimate.start(20)
	
func process_physics(delta:float):
	attacks.physics_process(delta)
	parent.parent.position.x += (576 - parent.parent.position.x)*0.1
	
func _end_timer():
	if inUlt:
		attacks.enter()
		timer.start(attacks.data.forswing + attacks.data.duration + attacks.backswing)
	
	elif(parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
	else:
		exit(canTransitionTo[0])

func exit(newState:State):
	EnemyStuff.dmg = 0
	super(newState)
	
func _end_ult():
	inUlt = false
	EnemyStuff.ult = false
