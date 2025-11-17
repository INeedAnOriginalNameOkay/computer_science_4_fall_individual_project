extends StateMachine

func enter():
	super()
	state.weight = 0.5

func transition(NewState: State):
	super(NewState)
