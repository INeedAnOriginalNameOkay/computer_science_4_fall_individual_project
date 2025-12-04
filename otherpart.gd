extends AnimatedSprite2D

func _on_rich_text_label_start_dialog() -> void:
	show()

func _on_rich_text_label_finish_dialog() -> void:
	hide()
