class_name enemy extends Entity

var canAttack: bool = true
@export var TBATimer: Timer

func _ready():
	EnemyStuff.hp = 1000
	super()
	
func _process(delta:float):
	#print(statemach.state)
	super(delta)
	
func check_collisions(body):
	if body.is_in_group("Player Hitbox") && !invincible && !EnemyStuff.ult:
		statemach.transition(launch_state)
		invincible = true
		EnemyStuff.hp -= PlayerGlobals.dmg
		i_frame_timer.start ( sqrt(abs(PlayerGlobals.launchVector.x+PlayerGlobals.launchVector.y))/200 ) 
		#ouchie wouchie

func TBA():
	canAttack = true
