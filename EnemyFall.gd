extends fall

func fall_speed(modifier: float, weight: float):
	parent.parent.velocity.y += gravity *  weight * modifier
	if(parent.parent.velocity.y >= gravity * weight * 15):
		parent.parent.velocity.y = gravity * weight * 15
		
func horizontal_speed(modifier: float):
	parent.parent.velocity.x = 0
