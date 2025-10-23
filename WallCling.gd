class_name wallcling extends State

var direction: int
@export var timer: Timer
var slip: bool

func enter():
	timer.start()
	slip = false
	direction = parent.parent.get_wall_normal().x
	if(direction == 1):
		parent.parent.animations.flip_h = false
	else:
		parent.parent.animations.flip_h = true

func exit(newState: State):
	super(newState)
	
func process_physics(delta: float):
	if slip:
		parent.parent.velocity.y = 200
	horizontal_speed(.3)
	if(!parent.parent.is_on_wall()):
		exit(canTransitionTo[0])

func slip_timer():
	slip = true
