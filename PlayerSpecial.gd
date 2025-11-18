extends PlayerAttackState

@export var projectile: PackedScene
var dthing: bool
func enter():
	parent.play_anim(animation_name)
	print(123)
	dthing = false
	timer.start(0.05)
 
func process_input(event:InputEvent):
	pass

func _end_timer():
	if dthing:
		super()
	else:
		timer.start(0.1)
		dthing = true
		var pew = projectile.instantiate()
		pew.set_pos(parent.parent.position)
		pew.velocity = Vector2(500, 0)
		add_child(pew)
