class_name launched extends State

@export var launch: Vector2
@export var timer: Timer

var initiate_knockback: bool
var pos: Vector2
var velocityx

func enter():
	_start_launch(launch)
	super()
	
func process_physics(delta:float):
	if(initiate_knockback):
		if(parent.parent.is_on_wall()):
			parent.parent.velocity.x = -1*velocityx
			_start_launch(Vector2(0-velocityx,parent.parent.velocity.y))
			
		if(parent.parent.velocity.x > 0):
			parent.parent.velocity.x -= 10
		else:
			parent.parent.velocity.x += 10
		fall_speed(0.5,weight)
	
		if(parent.parent.velocity.x == 0):
			exit(canTransitionTo[0])
		
		velocityx = parent.parent.velocity.x
	else: #hitshaker
		parent.parent.position = pos + 3*Vector2( randf()*2 -1 ,randf()*2 -1 )
		
func _start_launch(launching: Vector2):
	launch = launching
	initiate_knockback = false
	pos = parent.parent.position
	timer.start(sqrt( (launch.x * launch.x) + (launch.y + launch.y) )/3600 )

func _timer_timeout():
	parent.parent.position = pos
	parent.parent.velocity = launch
	initiate_knockback = true
