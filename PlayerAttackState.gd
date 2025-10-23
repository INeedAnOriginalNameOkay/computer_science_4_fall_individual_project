class_name PlayerAttackState extends AttackState

@export var attack_p: PlayerAttack

func enter():
	attacks = attack_p
	super()
