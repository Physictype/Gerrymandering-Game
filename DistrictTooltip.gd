extends Node2D


onready var grid = get_tree().get_root().get_node("Node2D/Grid")
onready var cam = get_tree().get_root().get_node("Node2D/Camera2D")
onready var bar = get_node("Control/VBoxContainer/HBoxContainer/ProgressBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	var district = grid.get_child(0).get_district_from_pos(grid.world_to_map(get_global_mouse_position()-get_viewport().size/2+cam.position))
	if district == null:
		hide()
		return
	show()
	bar.value=float(district.num_red())/float(district.get_size())*100.0
