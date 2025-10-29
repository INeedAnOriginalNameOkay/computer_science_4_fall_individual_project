class_name jump extends State

var canWallCling: bool
@export var raycast: RayCast2D
@export var timer: Timer

func enter():
	canWallCling = false
	timer.start()
	parent.parent.wall_cling_timer.start()
	parent.parent.velocity.y = 0
	super()
	
func exit(newState: State):
	super(newState)
	
func process_physics(delta: float):
	horizontal_speed(.5)
	fall_speed(1,weight)
	if parent.parent.velocity.y >= 0:
		exit(canTransitionTo[0])
	if raycast.is_colliding():
		parent.parent.velocity.y = 0
		exit(canTransitionTo[0])
		
	#if (parent.parent.is_on_wall() && canWallCling == true):
		#exit(canTransitionTo[1])

func wall_cling_timer():
	canWallCling = true
