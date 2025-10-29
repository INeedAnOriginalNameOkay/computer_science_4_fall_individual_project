extends attack
@export var ent:Entity
	
func _physics_process(delta: float) -> void:
	position = ent.position + offset
