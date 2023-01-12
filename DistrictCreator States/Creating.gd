extends State
class_name DistrictCreating

func enter(msg := {}):
	var owner = state_machine.owner
	var block = state_machine.owner.get_parent().block_from_pos(msg["pos"])
	if block == null:
		state_machine.transition_to("DistrictIdle")
	var district = District.new([block],owner.district_size,owner.district_margin)
	owner.districts.append(district)
	state_machine.transition_to("DistrictEditing",{"district":district})
