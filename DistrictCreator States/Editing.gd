extends State
class_name DistrictEditing

signal edited

signal over_district
signal not_over_district

var district
var input: bool = true
var index
var deleted = false

var is_over_district = false

func enter(msg := {}):
	district = msg["district"]
	index = get_parent().get_parent().districts.find(district)
	get_parent().get_parent().get_child(1).select_district(index)
func update(_delta: float):
	if not input:
		return
	var map_pos: Vector2 = owner.world_to_map(owner.get_global_mouse_position())
	var test_district: District = owner.get_district_from_pos(map_pos) # for a lack of a better name
	if test_district == null and is_over_district:
		emit_signal("not_over_district")
		is_over_district = false
	if test_district != null and not is_over_district:
		emit_signal("over_district",district)
		is_over_district = true
	if Input.is_action_pressed("left_button_clicked"):
		var owner = state_machine.owner
		if test_district == null:
			var block = owner.get_parent().block_from_pos(map_pos)
			if (not district.blocks.has(block)) and block != null:
				district.blocks.append(block)
				emit_signal("edited")
		elif test_district != district:
				state_machine.transition_to("DistrictEditing",{"district":test_district})
	if Input.is_action_pressed("right_button_clicked"):
		var owner = state_machine.owner
		if test_district == district:
			district.blocks.remove(district.blocks.find(owner.get_parent().block_from_pos(map_pos)))
			emit_signal("edited")
			if district.blocks.size() == 0:
				owner.districts.remove(owner.districts.find(district))
				owner.get_child(1).update_districts()
				deleted = true
				state_machine.transition_to("DistrictIdle")
			owner.get_child(1).update_districts()
	if Input.is_action_just_pressed("escape"):
		state_machine.transition_to("DistrictIdle")
	check_number_keys()
func check_number_keys():
	var numbers = ["one","two","three","four","five","six","seven","eight","nine","ten"]
	for i in range(10):
		if Input.is_action_just_pressed(numbers[i]) and owner.districts.size()>i:
			var district = owner.districts[i]
			state_machine.transition_to("DistrictEditing",{"district":district})
func _on_StateMachine_input_off():
	input = false

func exit():
	if deleted:
		return
	get_parent().get_parent().get_child(1).deselect_district(index)
