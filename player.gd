extends Entity

@export var healthbar: hpbar
signal playerDeath

func enter():
	PlayerGlobals.hp = 200
	healthbar.init_health(PlayerGlobals.hp)
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
		healthbar._set_hp(PlayerGlobals.hp)
		emit_signal("plyaerHit")
		i_frame_timer.start ( sqrt(abs(EnemyStuff.EnemyLaunchVector.x+EnemyStuff.EnemyLaunchVector.y))/400 ) 
		if PlayerGlobals.hp <= 0:
			emit_signal("playerDeath")
		#ouchie wouchie
