extends Control

var is_open

# Called when the node enters the scene tree for the first time.
func _ready():
	close();

func open():
	is_open = true;
	visible = true;
	pass;

func close():
	visible = false;
	is_open = false;
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if is_open:
			close();
		else:
			open();
