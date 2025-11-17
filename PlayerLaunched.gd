extends launched

func enter():
	_start_launch(EnemyStuff.EnemyLaunchVector)
	parent.play_anim(animation_name)
	PlayerGlobals.x_velocity = 0

func process_physics(delta:float):
	super(delta)
func fall_speed(modifier: float, weight: float):
	PlayerGlobals.fall_speed(modifier, weight)
	parent.parent.velocity.y = PlayerGlobals.y_velocity
		

func _start_launch(launching: Vector2):
	super(launching)
	PlayerGlobals.x_velocity = launch.x
	PlayerGlobals.y_velocity = launch.y
