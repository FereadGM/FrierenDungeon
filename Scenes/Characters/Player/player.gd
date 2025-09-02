extends Node3D

class_name Player

@export var playerName : String
@export var playerClass : CharacterClass
@export var inventory : Inventory

@export var playerLevel : int
@export var playerXp : int

@export var hp : int
@export var mana : int

@export var intelligence : int
@export var strength : int
@export var charisma : int
@export var constitution : int
@export var dexterity : int
@export var wisdom : int

@export var picture : Texture2D

@onready var playerController =  %PlayerController3D
@export var targetedEnemy : EnemyBase
@export var enemiesInRange : Array[EnemyBase]

var enemyIndex : int = -1;

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.AddItem(load("res://Ressources/Items/Staff.tres"))
	%InventoryUI.UpdateItems()
	SIGNALS.new_target_in_range.connect(_on_new_enemy_in_range)
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("auto_targeting") and enemiesInRange.size() > 0:
		SelectNextTarget();
		
		
func SelectNextTarget():
	print("Selecting new target")
	if targetedEnemy != null:
		targetedEnemy.RemoveHighlight();
	enemyIndex += 1;
	if enemyIndex >= enemiesInRange.size():
		enemyIndex = 0;
	targetedEnemy = enemiesInRange[enemyIndex];
	targetedEnemy.Highlight()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func GainXp(amountGained : int):
	if playerXp + amountGained >= CONSTANTS.XP_THRESHOLD[playerLevel]:
		if LevelUp():
			playerXp = playerXp + amountGained - CONSTANTS.XP_THRESHOLD[playerLevel]
	else:
		playerXp = playerXp + amountGained
	
func LevelUp() -> bool :
	if (playerLevel >=  CONSTANTS.MAX_LEVEL):
		return false
	playerLevel += 1
	return true

func Die():
	print("Player died")
	#TODO : Display death menu
	pass;

func ReceiveDamage(damage : int):
	if (hp > 0):
		hp = hp - damage
		if hp <= 0:
			Die()

func GetPosition() -> Vector3:
	return playerController.global_position

func _on_new_enemy_in_range(newEnemy: EnemyBase):
	print("Enemy origin: ", newEnemy.GetPosition())
	print("Player origin: ", playerController.global_position)
	print("distance : ", newEnemy.GetPosition().distance_to(playerController.global_position))
	if newEnemy.GetPosition().distance_to(playerController.global_position) < 50 :
		print("New enemy in my range " + newEnemy.name);
		enemiesInRange.push_back(newEnemy)
