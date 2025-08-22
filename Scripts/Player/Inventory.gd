extends Resource

class_name Inventory

@export var items : Array[Item]


func AddItem(item : Item):
	for i in range(items.size()):
		if items[i] == null:
			items[i] = item
			break
	
func RemoveItem(itemPos : int):
	items[itemPos] = null
