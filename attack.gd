class_name Attack
extends Node

@export var force: Vector2 #Launching. x vector assumes right
@export var damage: float #damage
@export var pen: float #shield breaking and armor ignoring
@export var hitboxes: Array[Vector2] # pairs of 2 represent position of the bottom left and top right corner of the hitbox relative to the player

func setAttack(f: Vector2, dmg: float, p: float, hbs: Array[Vector2]):
	force = f
	damage = dmg
	pen = p
	hitboxes = hbs
	
