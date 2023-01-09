extends State
class_name DistrictCreating

func enter(msg := {}):
	var owner = state_machine.owner
	var district = District.new([msg["pos"]],owner.district_size,owner.district_margin)
	owner.districts.append(district)
	state_machine.transition_to("DistrictEditing",{"district":district})
