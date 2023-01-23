extends State
class_name DistrictIdle

signal over_district
signal not_over_district

var input: bool = true

func update(delta: float) -> void:
	if not input:
		return
	var district: District = owner.get_district_from_pos(map_pos)
	if district == null:
		emit_signal("not_over_district")
	else:
		emit_signal("over_district")
	if Input.is_action_just_pressed("left_button_clicked"):
		var owner = state_machine.owner
		var map_pos: Vector2 = owner.world_to_map(owner.get_global_mouse_position())
		if district == null:
			state_machine.transition_to("DistrictCreating",{"pos":map_pos})
		else:
			state_machine.transition_to("DistrictEditing",{"district":district})

func exit():
	emit_signal("not_over_district")

func _on_StateMachine_input_off():
	input = false
