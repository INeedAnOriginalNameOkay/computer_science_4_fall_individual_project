extends StateMachine

func enter():
	super()
	state.weight = PlayerGlobals.weight

func physics_process(delta:float):
	super(delta)
	PlayerGlobals.pos = parent.position
