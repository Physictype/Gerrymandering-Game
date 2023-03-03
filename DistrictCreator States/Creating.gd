extends State
class_name DistrictCreating


var input: bool = true

func enter(msg := {}):
	if not input:
		return
	var owner = state_machine.owner
	var block = state_machine.owner.get_parent().block_from_pos(msg["pos"])
	print(block)
	if block == null:
		state_machine.transition_to("DistrictIdle")
		return
	var district = District.new([block],owner.district_size,owner.district_margin)
	owner.districts.append(district)
	owner.update_districts()
	state_machine.transition_to("DistrictEditing",{"district":district})
	emit_signal("entered")


func _on_StateMachine_input_off():
	input = false
