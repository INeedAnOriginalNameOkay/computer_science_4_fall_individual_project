class_name StateMachine extends Node

@export var initState: State
@export var parent: Entity
var state: State

func enter():
	state = initState
	state.enter()
	
func transition(newState: State):
	state = newState
	state.enter()

func process(delta: float):
	state.process(delta)
	
func physics_process(delta: float):
	state.process_physics(delta)
	
func input(event: InputEvent):
	state.process_input(event)

func play_anim(str: String):
	parent.play_anim(str)
