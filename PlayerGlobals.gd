extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var move_speed: float = 300 #movement speed
var weight: float = .5#affects fall speed 
var jumpPower: float = 1000#affects jump velocity
var grip: float = .8 #affects time to decelerate + wall clinging
var maxJumpCount: int = 3#max jumps
var jumpCount: int = maxJumpCount #amount of jumps done in onne "gigajump"
var launchVector: Vector2 = Vector2(0,0)
