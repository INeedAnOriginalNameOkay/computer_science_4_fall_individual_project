class_name State extends Node

@export var animation_name: String
@export var move_speed: float
@export var attack: Attack
@export var parent: StateMachine
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var canTransitionTo: Array[State]

#when 1st entering state
func enter():
	parent.play_anim(animation_name)
	
#when leaving state
func exit(newState: State):
	print(newState)
	parent.transition(newState)

#when an input happens
func process_input(event: InputEvent): #
	return null

#every normmal update tick
func process(delta: float):
	return null

#every physics update tick
func process_physics(delta: float):
	return null
