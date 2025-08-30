extends Control

@onready var item_visual: Sprite2D = $MarginContainer/HBoxContainer/CenterContainer/ItemDisplayPanel/ItemDisplay
@onready var item_label: Label = $MarginContainer/HBoxContainer/ItemLabel

var is_slot_empty : bool = true


func Clear():
	pass;
	
func SetItem(item : Item):
	#var image = Image.load_from_file(item.)
	if item == null:
		item_visual.visible = false;
		is_slot_empty = true;
	else:
		item_visual.visible = true;
		is_slot_empty = false;
		item_visual.texture = item.icon
		item_label.text = item.item_name
	
func _on_button_button_down():
	print("Pressed")
	##TODO : Call inventoryUI method to know what's the index of the node,
	# then implement a method in the player to delete item then call UpdateUI (iventory being a resource, it can't be use to find node
	pass # Replace with function body.
