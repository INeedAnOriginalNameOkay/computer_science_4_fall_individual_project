class_name State
extends Node

@export var animation_name: String
@export var move_speed: float
@export var attack: Attack
var parent: Entity
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal finished(new_state: String)

#when 1st entering state
func enter():
	parent.animations.play(animation_name)
	
#when leaving state
func exit():
	pass

#when an input happens
func process_input(event: InputEvent) -> State: #
	return null

#every normmal update tick
func frame(delta: float) -> State:
	return null

#every physics update tick
func process_physics(delta: float) -> State:
	return null
