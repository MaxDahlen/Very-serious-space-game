extends CharacterBody2D


var time = 0

var rotation_distance = 200
var ship_position = Vector2(0, 0)
var mus_vinkel = (0.0)

func _physics_process(delta: float) -> void:
	time += GlobalVariables.Universe_Speed * delta #styr hur snabbt systemet rör sig
	position.x = rotation_distance*cos(time)
	position.y = rotation_distance*sin(time)

	mus_vinkel = ship_position.angle_to_point(get_global_mouse_position()) #tar vinkeln mellan skeppet och musen
	mus_vinkel = abs(mus_vinkel)
	
	GlobalVariables.Universe_Speed = mus_vinkel
	
