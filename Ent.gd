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
var entered: bool = false

func enter() -> void:
	i_frame_timer.start(1)
	statemach.enter()
	entered = true
	
func _physics_process(delta: float) -> void:
	if !entered:
		return
	statemach.physics_process(delta)
	move_and_slide()
	
func _process(delta: float) -> void:	
	if !entered:
		return
	statemach.process(delta)

func _input(event: InputEvent) -> void:
	if !entered:
		return
	statemach.input(event)

func play_anim(str: String):
	if !entered:
		return
	animations.play(str)

func check_collisions(body):
	pass

func _end_invincibility():
	print("banan")
	invincible = false
