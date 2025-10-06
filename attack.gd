class_name Attack
extends Node

@export var force: Vector2 
#Launching. x vector assumes right
@export var damage: float
 #damage
@export var pen: float
 #shield breaking and armor ignoring
@export var hitboxes: Array[Vector2]
 # pairs of 2 represent position of the bottom left and top right corner of the hitbox relative to the player
@export var projectile: String
# if not some null, creates projectiles with above appearance Hitboxes array needs 2  : location (center) and one for size
