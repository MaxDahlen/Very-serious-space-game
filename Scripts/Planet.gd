extends CharacterBody2D

var time = 0
var specific_rotation_speed = 1
var rotation_distance


func _ready(): #Ser till att de roterar vid rätt avstånd
	rotation_distance = position.x
	
func _physics_process(delta: float) -> void:
	time += GlobalVariables.Universe_Speed * delta * specific_rotation_speed #styr hur snabbt systemet rör sig
	position.x = rotation_distance*cos(time)
	position.y = rotation_distance*sin(time)

	
	
