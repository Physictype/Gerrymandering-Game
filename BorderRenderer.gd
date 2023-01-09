extends Node2D


export(PackedScene) var district_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta: float):
	if get_parent().districts.size()-get_child_count() > 0:
		for i in range(get_parent().districts.size()-get_child_count()):
			var new_district = district_scene.instance()
			add_child(new_district)
	if get_parent().districts.size()-get_child_count() < 0:
		for i in range(-(get_parent().districts.size()-get_child_count())):
			remove_child(get_child(0))
	for i in range(len(get_parent().districts)):
		var district: Node2D = get_child(i)
		district.get_child(0).clear()
		district.get_child(1).clear()
		var wharoiesntoianfp = get_parent().districts[i]
		print(get_parent().districts[i])
		var party: int = get_parent().get_parent().block_from_pos(get_parent().districts[i]).calc_party()
		for block in get_parent().districts[i].blocks:
			district.get_child(0).set_cell(block.x,block.y,0)
			district.get_child(1).set_cell(block.x,block.y,party)
		district.get_child(0).update_bitmask_region(Vector2(get_parent().min_x,get_parent().min_y),Vector2(get_parent().max_x,get_parent().max_y))
