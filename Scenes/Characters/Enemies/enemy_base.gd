extends Node3D

class_name EnemyBase

@export var HP : int;
@export var mana : int;
@export var EnemyName : String;

@export var characterBody : CharacterBody3D

@onready var EntityName : Label = %EntityName

var HealthBorder : Panel
var HealthBar : ProgressBar


func _ready():
	EnemyName = "Enemy"
	EntityName.text = EnemyName
	HealthBorder = get_node("EntityUI/SubViewport/VBoxContainer/HealthBorder");
	HealthBar = get_node("EntityUI/SubViewport/VBoxContainer/HealthBorder/MarginContainer/EntityHealth");
	
func _to_string():
	return "EnemyBase"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func GetPosition() -> Vector3:
	return characterBody.global_position

func Highlight():
	var panelStyleBox : StyleBoxFlat = StyleBoxFlat.new()
	panelStyleBox.border_width_bottom = 2;
	panelStyleBox.border_width_left = 2;
	panelStyleBox.border_width_right = 2;
	panelStyleBox.border_width_top = 2;
	panelStyleBox.bg_color = Color(0, 0, 0, 0)
	HealthBorder.add_theme_stylebox_override("panel", panelStyleBox)


func RemoveHighlight():
	var panelStyleBox : StyleBoxFlat = HealthBorder.get_theme_stylebox("panel")
	panelStyleBox.border_width_bottom = 0;
	panelStyleBox.border_width_left = 0;
	panelStyleBox.border_width_right = 0;
	panelStyleBox.border_width_top = 0;
