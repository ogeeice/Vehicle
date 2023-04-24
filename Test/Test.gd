extends Spatial

export var Escaping = false

func _ready():
	EscapeGame()
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Escaping = !Escaping
		EscapeGame()

func EscapeGame():
	if Escaping == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
