class_name PlayerAttackState extends AttackState

@export var attack_p: attack

func enter():
	attacks = attack_p
	PlayerGlobals.launchVector = attack_p.data.knockback
	if(parent.parent.animations.flip_h == true):
		PlayerGlobals.launchVector.x = 0 - PlayerGlobals.launchVector.x
	print(PlayerGlobals.launchVector)
	super()
