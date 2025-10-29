class_name attack extends hitbox

@export var data:hitbox
@export var area: Area2D
@export var hitbox_duration: Timer
@export var foreswing: Timer
@export var backswing: float
@export var coll: CollisionShape2D
var saved_i: int
var hitbox_enabled: bool

func _ready():
	coll.disabled = true
	
func enter():
	foreswing.start(data.forswing)

func physics_process(delta:float):
	pass
	

func collisions(collided): 
	pass

func _foreswing_timer():
	coll.disabled = false
	hitbox_duration.start(data.duration)
	
func _duration_timer():
	coll.disabled = true
