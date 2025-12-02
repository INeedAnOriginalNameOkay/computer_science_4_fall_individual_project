class_name hpbar extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $DamageBar

var hp = 0 : set  = _set_hp

func _set_hp(new_hp):
	var prev_hp =  hp
	hp = min(max_value, new_hp)
	value = hp
	
	if hp < prev_hp:
		timer.start()
	else:
		damage_bar.value = hp

func init_health(new_hp):
	max_value = new_hp
	value = new_hp
	damage_bar.max_value = new_hp
	damage_bar.value = new_hp
	

func _on_timer_timeout() -> void:
	damage_bar.value = hp
