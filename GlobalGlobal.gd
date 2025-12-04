extends Node

var enemyGraphics: bool
var backGround: int #bigger value adds more depth
var grass: bool
var enhanceEnemy: bool
var fireballTexture: bool

func _ready():
	enemyGraphics = true
	backGround = 0
	grass = false
	enhanceEnemy = false
	fireballTexture = false
