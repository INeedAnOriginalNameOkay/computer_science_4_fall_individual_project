extends RigidBody2D

@export var entity: Entity

func _ready():
	$CollisionShape2D.disabled = true
