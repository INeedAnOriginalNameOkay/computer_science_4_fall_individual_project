class_name Entity
extends CharacterBody2D

@export var animations: AnimatedSprite2D
@export var move_speed: float
@export var statemach: StateMachine

func _ready() -> void:
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
