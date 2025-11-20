extends PlayerAttackState

@export var projectile: PackedScene
var dthing: bool
func enter():
	parent.play_anim(animation_name)
	dthing = false
	timer.start(0.2)
 
func process_input(event:InputEvent):
	pass

func _end_timer():
	if dthing:
		super()
	else:
		dthing = true
		var pew = projectile.instantiate()
		pew.position = parent.parent.position
		pew.position -= Vector2(0,35)
		pew.original = false
		if(parent.parent.animations.flip_h == true):
			pew.position -= Vector2(30,0)
			pew.linear_velocity = Vector2(-300, 0)
		else:
			pew.position += Vector2(30,0)
			pew.linear_velocity = Vector2(300, 0)
		add_child(pew)
		timer.start(0.2)
