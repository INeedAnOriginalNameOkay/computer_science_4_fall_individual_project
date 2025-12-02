extends RichTextLabel

func _ready() -> void:
	new_dialog("Testing testing-")
	print(get_total_character_count())
	await visible_characters == get_total_character_count()
	new_dialog("Seems like it works. I'm surprised something this incomplete even functions.")
	await visible_characters == get_total_character_count()
	await Input.is_action_just_pressed("jump")
	new_dialog("How'd you even know of this? No one should've said a thing about it.")

func new_dialog(dialog: String):
	text = dialog
	visible_characters = 0 

func _process(delta: float):
	tick()
	
func tick():
	if(visible_characters < get_total_character_count()):
		visible_characters += 1
		if(Input.is_action_just_pressed("jump")):
			visible_characters = get_total_character_count()
