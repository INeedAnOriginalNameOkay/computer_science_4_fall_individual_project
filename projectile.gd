extends RigidBody2D

@export var entity: Entity
func _ready():
	$CollisionShape2D.disabled = true

func set_pos(pos: Vector2):
	position = pos
