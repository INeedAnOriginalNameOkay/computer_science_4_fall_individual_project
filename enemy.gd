extends Entityy

func _ready():
	position = Vector2(300,400)
	speed = 400.0
	jump_speed = -700.0
	weight = 1.4
	grip = .05
	jumpCount = 5
	netspeed = 0
	jumpLeft = jumpCount-1
	dash = 0
	state = "ground" 
	canWallCling = false
	canDash = false
	acceptingDash = false

func _physics_process(delta: float) -> void:
	super(delta)
