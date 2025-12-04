extends RichTextLabel

signal textVisible
signal spacebar
signal startDialog
signal finishDialog

func start():
	new_dialog("Testing testing-")
	print(get_total_character_count())
	await textVisible
	await get_tree().create_timer(0.4).timeout
	new_dialog("Seems like it works. I'm surprised something this incomplete even functions.")
	await textVisible
	await spacebar
	new_dialog("How'd you even know of this? No one should've said a thing about it.")
	await textVisible
	await spacebar
	end_dialog()

func end_dialog():
	text = ""
	finishDialog.emit()
	
func new_dialog(dialog: String):
	visible_characters = 0 
	text = dialog
	startDialog.emit()

func _process(delta: float):
	tick()

func _input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("jump")):
		spacebar.emit()
func tick():
	if(visible_characters < get_total_character_count()):
		visible_characters += 1
		if visible_characters == get_total_character_count():
			textVisible.emit()
