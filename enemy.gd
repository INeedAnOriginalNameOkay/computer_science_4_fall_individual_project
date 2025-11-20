class_name enemy extends Entity

var canAttack: bool = true
@export var TBATimer: Timer

func _ready():
	EnemyStuff.hp = 1000
	EnemyStuff.phase = 1
	super()
	
func _process(delta:float):
	#print(statemach.state)
	super(delta)
	
func check_collisions(body):
	if body.is_in_group("Player Hitbox") && !EnemyStuff.ult:
		print("ouchie")
		if !invincible:
			statemach.transition(launch_state)
		invincible = true
		if(body.is_in_group("Projectile")):
			if animations.flip_h == true:
				EnemyStuff.LaunchedVector = Vector2(-200,200)
			else:
				EnemyStuff.LaunchedVector = Vector2(200,200)
			EnemyStuff.hp -= 5.5
			i_frame_timer.start(0.1)
		else:
			EnemyStuff.LaunchedVector = PlayerGlobals.launchVector
			EnemyStuff.hp -= PlayerGlobals.dmg
			i_frame_timer.start ( sqrt(abs(PlayerGlobals.launchVector.x)+abs(PlayerGlobals.launchVector.y))/200 ) 
		#ouchie wouchie

func TBA():
	canAttack = true
