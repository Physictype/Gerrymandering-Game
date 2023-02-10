extends Node2D


onready var districts = get_tree().get_root().get_node("Node2D/Grid/Districts")
onready var cam = get_tree().get_root().get_node("Node2D/Camera2D")
onready var bar = get_node("Control/VBoxContainer/HBoxContainer/ProgressBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	var district = districts.get_district_from_pos(districts.world_to_map(get_local_mouse_position()+cam.position+Vector2(19,-25)))
	print(districts.world_to_map(get_global_mouse_position()+cam.position)+Vector2(19,-25))
	if district == null:
		return
	bar.value=district.num_red()/district.get_size()
