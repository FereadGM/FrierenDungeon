extends Control

var is_open

# Called when the node enters the scene tree for the first time.
func _ready():
	close();

func open():
	is_open = true;
	visible = true;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func close():
	visible = false;
	is_open = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if is_open:
			close();
		else:
			open();
			
	if is_open and Input.is_action_just_pressed("ui_cancel"):
		close();
