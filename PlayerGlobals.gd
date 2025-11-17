extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_hp: int = 100
var move_speed: float = 300 #movement speed
var weight: float = .5#affects fall speed 
var jumpPower: float = 1000#affects jump velocity
var grip: float = .8 #affects time to decelerate + wall clinging
var maxJumpCount: int = 3#max jumps
var jumpCount: int = maxJumpCount #amount of jumps done in onne "gigajump"
var launchVector: Vector2 = Vector2(0,0)
var y_velocity: float
var x_velocity: float
var pos: Vector2
var hp: float
var dmg: float

func fall_speed(modifier: float, weight: float): 
	y_velocity += gravity *  PlayerGlobals.weight * modifier
	if(y_velocity >= gravity * PlayerGlobals.weight * 15):
		y_velocity = gravity * PlayerGlobals.weight * 15
	
func horizontal_speed(modifier: float):
	var deltax = (PlayerGlobals.move_speed) * (PlayerGlobals.grip / 5) * modifier
		
	if(Input.is_action_pressed("ui_left")):
		x_velocity -= deltax
		if(abs(x_velocity) > PlayerGlobals.move_speed):
			x_velocity = 0 - PlayerGlobals.move_speed
		
	elif(Input.is_action_pressed("ui_right")):
		x_velocity += deltax
		if(abs(x_velocity) > PlayerGlobals.move_speed):
			x_velocity = PlayerGlobals.move_speed
