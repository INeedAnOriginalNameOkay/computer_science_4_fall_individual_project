class_name Entity
extends CharacterBody2D

@export var animations: AnimatedSprite2D
@export var move_speed: float
@export var statemach: StateMachine
@export var wall_cling_timer: Timer
@export var i_frame_timer: Timer
@export var launch_state: State
@export var hurtbox: CollisionShape2D
var invincible: bool

func _ready() -> void:
	i_frame_timer.start(1)
	statemach.enter()
	
func _physics_process(delta: float) -> void:
	statemach.physics_process(delta)
	move_and_slide()
	
func _process(delta: float) -> void:	
	statemach.process(delta)

func _input(event: InputEvent) -> void:
	statemach.input(event)

func play_anim(str: String):
	animations.play(str)

func check_collisions(body):
	pass

func _end_invincibility():
	print("banan")
	invincible = false
