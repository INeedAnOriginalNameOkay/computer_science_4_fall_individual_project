extends RigidBody2D

@export var entity: Entity
var original: bool = true

func _ready():
	$CollisionShape2D.disabled = true
		
func touching(body):
	if(body.is_in_group("Enemy Hurtbox")):
		await get_tree().create_timer(0.1).timeout
		queue_free()
