class_name HPBar extends TextureProgressBar

func start():
	update()

func update():
	value = PlayerGlobals.hp
