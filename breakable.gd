extends StaticBody2D

func _ready():
	show()
	position = Vector2(200,200)

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
