extends Entityy
	
func _ready():
	speed = 400.0
	jump_speed = -700.0
	weight = 1.4
	grip = .05
	jumpCount = 5
	netspeed = 0
	jumpLeft = jumpCount-1
	dash = 0
	state = "ground" 
	canWallCling = true
	canDash = true
	acceptingDash = true
	
func _physics_process(delta: float) -> void:
			#Wall Clinging/Jumping
	_state()
	
	if state != "dash" && !isWallJump:
		direction = Input.get_axis("ui_left", "ui_right")
	super(delta)

func _state():
	if (Input.is_action_just_pressed("dash") && canDash && acceptingDash): #Dash
		state = "dash"
		dash = 8
		acceptingDash = false
		$DashTimer.start()
	elif dash > 0:
		state = "dash"
	elif !is_on_floor():
		if _is_wall_cling():
			if Input.is_action_just_pressed("jump") && !isWallJump: #Wall Jump
				$WallJumpKickback.start()
				isWallJump = true
				state = "wallJump"
				
			elif !isWallJump: #Wall Cling
				state = "wallCling"
			dash = 0
			
		elif Input.is_action_just_pressed("jump") && jumpLeft > 0: #doublejumps
			state = "jump"
			
		else: #nothing happening in air
			state = "air"
			
	elif Input.is_action_just_pressed("jump"): #initialtes jumps
		state = "jump"
	elif state != "attack" :
		state = "ground"
	
func _on_wall_jump_kickback_timeout() -> void:
	isWallJump = false

func _on_dash_timer_timeout() -> void:
	acceptingDash = true
