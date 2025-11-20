extends RichTextLabel

func _process(delta: float) -> void:
	text = str( round(PlayerGlobals.hp) ) + "HP; Enemy HP:" + str(round(EnemyStuff.hp))
