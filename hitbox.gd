class_name attack extends Area2D

@export var data: Array[hitbox]
@export var collisionshape: CollisionShape2D
@export var hitbox_timers: Array[Timer]
@export var backswing: float
var saved_i: int
var hitbox_enabled: Array[bool]
func enter():
	for i in range(data.size()):
		get_tree().create_timer(data[i].forswing)
		#do attack things like summoning the hitbox
		#lingering hitboxes are pretty important too
		hitbox_timers[i].start(data[i].duration)
		
	get_tree().create_timer(backswing)
	return

func physics_process(delta:float):
	
	for i in range(hitbox_enabled.size()):
		
		saved_i = i
		if(hitbox_enabled[i]):
			collisionshape.disabled = false
			var hitbox_shape = CapsuleShape2D.new()
			hitbox_shape.radius = data[i].radius
			hitbox_shape.height = data[i].height
			collisionshape.shape = hitbox_shape
			collisionshape.rotation = data[i].rotation
		else:
			collisionshape.disabled = true

func collisions(collided): 
	pass
