extends Entity

func _ready():
	PlayerGlobals.hp = 200
	super()
	
func _process(delta:float):
	pass

func _physics_process(delta: float):
	PlayerGlobals.pos = position
	super(delta)
	
func check_collisions(body):
	if body.is_in_group("Enemy Hitbox") && !invincible:
		statemach.transition(launch_state)
		invincible = true
		PlayerGlobals.hp -= EnemyStuff.dmg
		i_frame_timer.start ( sqrt(abs(EnemyStuff.EnemyLaunchVector.x+EnemyStuff.EnemyLaunchVector.y))/400 ) 
		#ouchie wouchie
