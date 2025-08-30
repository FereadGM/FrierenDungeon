extends Node3D

class_name EnemyBase

@export var HP : int;
@export var mana : int;
@export var EnemyName : String;

func _to_string():
	return "EnemyBase"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
