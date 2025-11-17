class_name PlayerAttackState extends AttackState

@export var attack_p: attack

func enter():
	attacks = attack_p
	PlayerGlobals.launchVector = attack_p.data.knockback
	if(parent.parent.animations.flip_h == true):
		PlayerGlobals.launchVector.x = 0 - PlayerGlobals.launchVector.x
	PlayerGlobals.dmg = attacks.damage
	super()

func process_input(event:InputEvent):
	if(!attack_p.coll.disabled):
		return

func process_physics(delta:float):
	#check if hitbox hit an enemy
	if(false):
		parent.parent.animations.pause()
		#put some timer shenanigans here

func exit(newState: State):
	PlayerGlobals.dmg = 0
	super(newState)
