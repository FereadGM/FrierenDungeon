extends Node3D

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

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.AddItem(load("res://Ressources/Items/Staff.tres"))
	%InventoryUI.UpdateItems()
	pass # Replace with function body.


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
