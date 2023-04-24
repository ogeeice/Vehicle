extends VehicleBody

export var AutoDrive = false

export var Vehicle_Steer_speed = 0.5
export var Vehicle_Speed = 600
export var HandBrake = 5.0

func _physics_process(delta: float) -> void:
	steering = lerp(steering,Input.get_axis("SteerRight","SteerLeft"), Vehicle_Steer_speed)
	
#	if Input.is_action_pressed("ui_select"):
#		brake = lerp(0,HandBrake,2.5)
#	elif Input.is_action_just_released("ui_select"):
#		brake = lerp(HandBrake,0,2.5)
	
	if AutoDrive == true:
		engine_force = -1 * Vehicle_Speed
	else:
		engine_force = Input.get_axis("Accelerate","Reverse") * Vehicle_Speed
	pass
