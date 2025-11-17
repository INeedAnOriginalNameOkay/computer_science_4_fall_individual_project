extends AttackState

func enter():
	parent.parent.velocity.y = -1000
	horizontal_speed(1)
	EnemyStuff.EnemyLaunchVector = attacks.data.knockback
	if(parent.parent.animations.flip_h == true):
		EnemyStuff.EnemyLaunchVector.x = 0 - EnemyStuff.EnemyLaunchVector.x
	EnemyStuff.dmg = attacks.damage
	super()

func process_physics(delta:float):
	fall_speed(1,1)
	super(delta)
	
func fall_speed(modifier: float, weight: float):
	parent.parent.velocity.y += gravity *  weight * modifier
	if(parent.parent.velocity.y >= gravity * weight * 15):
		parent.parent.velocity.y = gravity * weight * 15
		
func horizontal_speed(mod: float):
	parent.parent.velocity.x = 300 * (PlayerGlobals.pos.x - parent.parent.position.x)/abs(PlayerGlobals.pos.x - parent.parent.position.x)

func exit(newState:State):
	EnemyStuff.dmg = 0
	super(newState)
	
func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
