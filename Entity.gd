extends CharacterBody2D

class_name Entityy

var speed: float
var jump_speed: float
var weight: float
var grip: float
var jumpCount: int
var canWallCling
var canDash
var acceptingDash
var isWallCling = false
var isWallJump = false

# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var netspeed: float
var jumpLeft: int
var dash: int
var state: String
#ground
#jump
#air
#freefall
#wallCling
#wallJump
#dash
var curState = state
var direction = 0 #for non-conventional movement like dashing
func _physics_process(delta):
	if(state == "dash"):
		dash -= 1
		print(dash)
		if dash == 0:
			velocity.x = _horizonatal_move(speed, direction)
			_vertical_move(delta)
		else:
			velocity.x = _horizonatal_move(speed*6, direction)
			velocity.y = 0
	else:
		velocity.x = _horizonatal_move(speed, direction)
		_vertical_move(delta)
	move_and_slide()
	
func _is_wall_cling() -> bool:
	return (is_on_wall() && canWallCling) && !is_on_floor()
	
func _vertical_move(delta):
	# Handle Jump.
	if is_on_floor():
		jumpLeft = jumpCount - 1
	
	if state == "jump" || state == "wallJump":
		velocity.y = jump_speed
		if not(is_on_floor()):
			jumpLeft -= 1
	if state == "wallJump": #for wall jumping
			direction = get_last_slide_collision().get_normal().x
		
	# Add the gravity
	elif state == "wallCling":
		if -Input.get_axis("ui_left", "ui_right") == get_last_slide_collision().get_normal().x:
			velocity.y = gravity * delta * weight * grip * 150
		else: 
			velocity.y += gravity * delta * weight
	else:
		velocity.y += gravity * delta * weight
	
	if velocity.y > gravity * 50 * delta:
		velocity.y = gravity * 50 * delta
	
func _horizonatal_move(spe, direc) -> float:
	if isWallJump:
		netspeed += spe * direction
		if abs(netspeed) > spe:
			netspeed = spe * direction
	else:
		if(direc != 0): #movement
			netspeed += spe * (grip*2) * direc
			if abs(netspeed) > spe:
				netspeed = spe * direc
		elif netspeed != 0: #sliding
			if netspeed < 0:
				netspeed += spe * grip
			else:
				netspeed -= spe * grip
	return netspeed

func _state():
	pass
