class_name PlayerAttackState extends AttackState

@export var attack_p: attack

func enter():
	attacks = attack_p
	super()
