extends State
class_name DistrictEditing

var district
var input: bool = true

func enter(msg := {}):
	district = msg["district"]
func update(_delta: float):
	if not input:
		return
	if Input.is_action_pressed("left_button_clicked"):
		var owner = state_machine.owner
		var map_pos: Vector2 = owner.world_to_map(owner.get_global_mouse_position())
		var test_district: District = owner.get_district_from_pos(map_pos) # for a lack of a better name
		if test_district == null:
			var block = owner.get_parent().block_from_pos(map_pos)
			if (not district.blocks.has(block)) and block != null:
				district.blocks.append(block)
		elif test_district != district:
				state_machine.transition_to("DistrictEditing",{"district":test_district})
	if Input.is_action_pressed("right_button_clicked"):
		var owner = state_machine.owner
		var map_pos: Vector2 = owner.world_to_map(owner.get_global_mouse_position())
		var test_district: District = owner.get_district_from_pos(map_pos) # for a lack of a better name
		if test_district == district:
			district.blocks.remove(district.blocks.find(owner.get_parent().block_from_pos(map_pos)))
			if district.blocks.size() == 0:
				state_machine.transition_to("DistrictIdle")
	if Input.is_action_just_pressed("escape"):
		state_machine.transition_to("DistrictIdle")


func _on_StateMachine_input_off():
	input = false
