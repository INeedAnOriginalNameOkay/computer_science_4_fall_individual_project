extends Node

@export var move_speed: float = 300 #movement speed
@export var weight: float = .5#affects fall speed 
@export var jumpPower: float = 1000#affects jump velocity
@export var grip: float = .8 #affects time to decelerate + wall clinging
@export var maxJumpCount: int = 3#max jumps
@export var jumpCount: int = maxJumpCount #amount of jumps done in onne "gigajump"
