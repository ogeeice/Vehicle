extends VehicleBody

export var AutoDrive = false
export var HandbrakeActive = false

export var Vehicle_Steer_speed = 1.0
export var Vehicle_Speed = 600
export var DRIFT_FORCE = 2000

var WheelDirection = 1
var AutoDrift = false

func _ready():
	if HandbrakeActive == true:
		AutoDrift = false
	else:
		AutoDrift = true

func _physics_process(delta):
	RayDetect()
	
	if AutoDrive == true:
		engine_force = -1 * Vehicle_Speed
	else:
		engine_force = Input.get_axis("Accelerate","Reverse") * Vehicle_Speed
	
	



func RayDetect():
	if $FloorDetect/FloorRay.is_colliding():
		var FloorDetector = $FloorDetect/FloorRay.get_collider()
		if FloorDetector.is_in_group("FLOOR"):
			if Input.is_action_pressed("SteerLeft"):
				steering = lerp(steering,WheelDirection, Vehicle_Steer_speed)
		#		set_steering(1)
				if AutoDrift == true:
					add_torque(Vector3(0, DRIFT_FORCE, 0))
			elif Input.is_action_pressed("SteerRight"):
				steering = lerp(steering,-WheelDirection, Vehicle_Steer_speed)
	#			set_steering(-1)
				if AutoDrift == true:
					add_torque(Vector3(0, -DRIFT_FORCE, 0))
			else:
				set_steering(0)

			if HandbrakeActive == true:
				if Input.is_action_pressed("Handbrake"):
					add_torque(Vector3(0, steering * DRIFT_FORCE, 0))
