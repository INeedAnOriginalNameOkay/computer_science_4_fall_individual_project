class_name State extends Node

@export var animation_name: String
@export var parent: StateMachine
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var canTransitionTo: Array[State]
var weight: float

#when 1st entering state
func enter():
	parent.play_anim(animation_name)
	
#when leaving state
func exit(newState: State):
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

func fall_speed(modifier: float, weight: float):
	parent.parent.velocity.y += gravity *  PlayerGlobals.weight * modifier
	if(parent.parent.velocity.y >= gravity * PlayerGlobals.weight * 15):
		parent.parent.velocity.y = gravity * PlayerGlobals.weight * 15
		
func horizontal_speed(modifier: float):
	var deltax = (PlayerGlobals.move_speed) * (PlayerGlobals.grip / 5) * modifier
		
	if(Input.is_action_pressed("ui_left")):
		parent.parent.velocity.x -= deltax
		if(abs(parent.parent.velocity.x) > PlayerGlobals.move_speed):
			parent.parent.velocity.x = 0 - PlayerGlobals.move_speed
		
	elif(Input.is_action_pressed("ui_right")):
		parent.parent.velocity.x += deltax
		if(abs(parent.parent.velocity.x) > PlayerGlobals.move_speed):
			parent.parent.velocity.x = PlayerGlobals.move_speed
	
