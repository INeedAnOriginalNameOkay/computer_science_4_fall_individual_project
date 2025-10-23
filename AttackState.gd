class_name AttackState extends State

var attacks: attack

func enter():
	super()
	attacks.enter()
	exit(canTransitionTo[0])

func process_physics(delta:float):
	attacks.physics_process(delta)
