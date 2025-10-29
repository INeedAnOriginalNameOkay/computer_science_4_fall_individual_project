class_name AttackState extends State

var attacks: attack
@export var timer: Timer
func enter():
	super()
	attacks.enter()
	timer.start(attacks.data.forswing + attacks.data.duration + attacks.backswing)
	
func process_physics(delta:float):
	attacks.physics_process(delta)

func _end_timer():
	if(parent.parent.is_on_floor()):
		exit(canTransitionTo[1])
	else:
		exit(canTransitionTo[0])
