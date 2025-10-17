extends Node

@export var force: Vector2 
#Launching. x vector assumes right
@export var damage: float
 #damage
@export var pen: float
 #shield breaking and armor ignoring
@export var hitboxes: Array[Vector2]
 # pairs (1 for location rlative to summoner, another for the sizing)
@export var projectile: String
# if not some null, creates projectiles with above appearance Hitboxes array needs 2  : location (center) and one for size
