extends Node

@export var amulet_icon_template: PackedScene
@export var amulets_panel: Container

@export var amulets_list: Array[Amulet] = []
 
@export var amulets_avaliable: Array[int] = []


func _ready():
	for amulet_id in amulets_avaliable:
		var amulet_representation = amulet_icon_template.instantiate()
		amulet_representation.texture = amulets_list[amulet_id].texture
		amulet_representation.tooltip_text = "[b]" + amulets_list[amulet_id].name + "[/b]\n" +  amulets_list[amulet_id].description 
		amulets_panel.add_child(amulet_representation)

func atach_amulet(id):
	amulets_avaliable.append(id)
	var amulet_representation = amulet_icon_template.instantiate()
	amulet_representation.texture = amulets_list[id].texture
	amulet_representation.tooltip_text = "[b]" + amulets_list[id].name + "[/b]\n" +  amulets_list[id].description 
	amulets_panel.add_child(amulet_representation)
