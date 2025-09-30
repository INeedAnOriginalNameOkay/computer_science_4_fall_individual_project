class_name StateMachine extends Node

var initState: State
var state: State
func _ready():
	state = initState
	
func transition(tr: State):
	state = tr
	state.enter()
