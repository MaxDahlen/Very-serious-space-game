extends CharacterBody2D


var time = 0

var rotation_distance = 200

func _physics_process(delta: float) -> void:
	time += GlobalVariables.Universe_Speed * delta #styr hur snabbt systemet rör sig
	position.x = rotation_distance*cos(time)
	position.y = rotation_distance*sin(time)

	
	
