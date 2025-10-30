extends attack
@export var ent:Entity
	
func _physics_process(delta: float) -> void:
	if(ent.animations.flip_h):
		position = ent.position + Vector2(0-offset.x, offset.y)
	else:
		position = ent.position + offset 
