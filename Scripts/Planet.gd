extends CharacterBody2D

var time = 0

var rotation_distance
var rotation_position_x
var rotation_position_y

func _ready(): #Ser till att de roterar vid rätt avstånd
	rotation_distance = sqrt(position.x**2 + position.y**2)
	rotation_position_x = cos(position.x / rotation_distance)
	rotation_position_y = cos(position.y / rotation_distance)
func _physics_process(delta: float) -> void:
	time += GlobalVariables.Universe_Speed * delta / (rotation_distance/1000) #styr hur snabbt systemet rör sig
	position.x = rotation_distance*cos(time + rotation_position_x)
	position.y = rotation_distance*sin(time + rotation_position_y)

	
	
