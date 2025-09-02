extends Node

class_name GameEngine

signal new_target_to_range;

@export var RootSceneNode : Node
@export var PlayerNode : Player

var EnemiesList : Array[EnemyBase]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test_key"):
		var enemyScene : PackedScene = load("res://Scenes/Characters/Enemies/enemy_base.tscn")
		var enemy : EnemyBase = enemyScene.instantiate()
		enemy.name = "Toto"
		var enemy2 : EnemyBase = enemyScene.instantiate()
		enemy.name = "Toto2"
		RootSceneNode.add_child(enemy)
		RootSceneNode.add_child(enemy2)
		enemy2.global_position = Vector3(1, 0, 0)



func _on_child_entered_tree(node: Node):
	if node.to_string() == "EnemyBase":
		print("New enemy spawned : ", node.name)
		var newEnemy : EnemyBase = node
		EnemiesList.push_back(newEnemy)
		SIGNALS.new_target_in_range.emit(newEnemy);
			


func _on_main_child_exiting_tree(node):
	if node.to_string() == "EnemyBase":
		print("Enemy destroyed : ", node.name)
		EnemiesList.remove_at(EnemiesList.find(node))
