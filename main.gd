extends Node2D
@export var player = CharacterBody2D
func _ready():
	$Camera2D.enabled = false

	#dialog stuff
	_reset()

func _reset():
	$Camera2D.enabled = false
	$player.position = Vector2(200,0)
	$Enemy.position = Vector2(948,0)
	($player).enter()
	($Enemy).enter()
	
func _game_over():
	$Camera2D.position = $player.position
	$Camera2D.zoom = Vector2(5,5)
	($player).statemach.state = $player/StateMachine/Freeze
	($Enemy).statemach.state = $Enemy/StateMachine/Freeze
	$Timer.start(2)
	#dialog idk
	

func _player_death():
	_game_over()
	
func _enemy_death():
	_game_over()


func _on_timer_timeout() -> void:
	_reset()
