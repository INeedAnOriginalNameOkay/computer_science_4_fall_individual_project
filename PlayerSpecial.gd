extends PlayerAttackState

@export var projectile: PackedScene
func enter():
	super()
	attacks.enter()
	timer.start(attacks.data.forswing + attacks.data.duration + attacks.backswing)
