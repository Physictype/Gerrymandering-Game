extends State
class_name DistrictIdle

func update(delta: float) -> void:
	if Input.is_action_just_pressed("left_button_clicked"):
		var owner = state_machine.owner
		var map_pos: Vector2 = owner.world_to_map(owner.get_global_mouse_position())
		var district: District = owner.get_district_from_pos(map_pos)
		if district == null:
			state_machine.transition_to("DistrictCreating",{"pos":map_pos})
		else:
			state_machine.transition_to("DistrictEditing",{"district":district})
