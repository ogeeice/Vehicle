extends Camera

export var Cam_Distance = 25.0 # DEFAULT 4.0
export var Cam_height = 10.0 # DEFAULT 2.0 


func _ready():
	current = true
	set_as_toplevel(true)


func _process(_delta):
	var target = get_parent().global_transform.origin
	var Pos = self.global_transform.origin
	var up = Vector3.UP
	
	var offset = Pos - target
	offset = offset.normalized() * Cam_Distance
	offset.y = Cam_height
	
	Pos = target + offset
	
	look_at_from_position(Pos,target,up)
