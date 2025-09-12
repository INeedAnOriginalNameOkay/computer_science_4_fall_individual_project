extends CharacterBody2D

@export var speed = 300.0
@export var jump_speed = -600.0
@export var weight = 1.0
@export var grip = .05
@export var canWallCling = true
var isWallCling

# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var netspeed = 0
var jumpCount = 1
var dash = 0
var freefall = true
func _physics_process(delta):
	
	if dash > 0:
		dash -= 1
		move_and_slide()
		return
	
	#Wall Clinging/Jumping
	isWallCling = _is_wall_cling()
	# Handle Jump.
	if is_on_floor() or isWallCling != "false":
		jumpCount = 1
	
	if Input.is_action_just_pressed("jump") && jumpCount > 0:
		freefall = false
		if not(is_on_floor()):
			jumpCount -= 1
		if isWallCling != "false":
			velocity.x +=  speed * get_wall_normal().x
		velocity.y = jump_speed
	if Input.is_action_just_released("jump"):
		if(!freefall) && velocity.y < 0:
			velocity.y = 0
			freefall = true
		
	# Add the gravity
	if isWallCling != "false":
		if velocity.y < 0:
			velocity.y = 0
		else:
			velocity.y += gravity * delta * weight / 10
	else:
		velocity.y += gravity * delta * weight
	
	velocity.x = _horizonatal_move()
	
	move_and_slide()
	
func _is_wall_cling() -> String:
	if (is_on_wall() && canWallCling) && !is_on_floor():
		for i in get_slide_collision_count():
			if(get_slide_collision(i).get_normal().x > 0 && Input.is_action_pressed("ui_left") ):
				return "left"
			elif(get_slide_collision(i).get_normal().x < 0 && Input.is_action_pressed("ui_right")):
				return "right"
	return "false"
	
func _horizonatal_move() -> float:
	var direction = Input.get_axis("ui_left", "ui_right")
	if(direction != 0): #movement
		if Input.is_action_just_pressed("dash"):
			dash = 8
			netspeed = speed * 4 * direction
			return netspeed
		netspeed += speed * (grip*2) * direction
		if abs(netspeed) > speed:
			netspeed = speed * direction
	elif netspeed != 0: #sliding
		if netspeed < 0:
			netspeed += speed * grip
		else:
			netspeed -= speed * grip
	return netspeed
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	print("hi")
