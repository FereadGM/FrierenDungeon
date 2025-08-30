extends Node

class_name GameEngine

signal new_target_to_range;

@export var RootSceneNode : Node
@export var PlayerNode : Node3D

var EnemiesList : Array[EnemyBase]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test_key"):
		var test1: Node3D = Node3D.new()
		test1.name = "Test"
		var enemy2: EnemyBase = EnemyBase.new()
		enemy2.name = "Toto"
		RootSceneNode.add_child(test1)
		RootSceneNode.add_child(enemy2)



func _on_child_entered_tree(node: Node):
	if node.to_string() == "EnemyBase":
		print("New enemy spawned : ", node.name)
		var newEnemy : EnemyBase = node
		EnemiesList.push_back(newEnemy)
		if newEnemy.transform.origin.distance_to(PlayerNode.transform.origin) < 200:
			new_target_to_range.emit(newEnemy);
			


func _on_main_child_exiting_tree(node):
	if node.to_string() == "EnemyBase":
		print("Enemy destroyed : ", node.name)
		EnemiesList.remove_at(EnemiesList.find(node))
