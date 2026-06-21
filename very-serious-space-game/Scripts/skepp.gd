extends CharacterBody2D

var speed_x = 10.0
var speed_y = 10.0
var mus_vinkel = (0.0)
var mus_vinkel_hastighet = (0.0)
const engine_power = -10 #Är åt del håll om den är positiv
const max_speed = 500

func Unviversum_speed ():
	mus_vinkel = get_global_mouse_position().angle_to_point(position) #tar vinkeln mellan skeppet och musen
	if mus_vinkel >= 0: #Gör om så norr är noll
		mus_vinkel_hastighet = abs(cos(mus_vinkel))
	else:
		mus_vinkel_hastighet = (1 + abs(cos(mus_vinkel + PI/2)))
	
	GlobalVariables.Universe_Speed = GlobalVariables.Universum_max * mus_vinkel_hastighet #Sätter universums hastighet


func Engine_burn(): #Medan musen är nedtryckt öka hastigheten mot musen
	if Input.is_action_pressed("Klick"):
		if abs(speed_x + cos(mus_vinkel) * engine_power) <= max_speed: #Kollar så vi inte får oändligt snabbt skepp (kanske ska tas bort)
			speed_x += cos(mus_vinkel) * engine_power
			
		if abs(speed_y + sin(mus_vinkel) * engine_power) <= max_speed:
			speed_y += sin(mus_vinkel) * engine_power


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position()) #Vrider skeppet Estetiskt

	Engine_burn()
	
	velocity = Vector2(speed_x,speed_y) #Rör skeppet i x och y
	move_and_slide()
	
	Unviversum_speed()
	
