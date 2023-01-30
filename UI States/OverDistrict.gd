extends UI_State
class_name UIOverDistrict

var district: District
var tooltip_data

func enter(msg := {}):
	district = msg["district"]

func update(_delta):
	tooltip_data.get_child(0).text = district.get_instance_id()
	tooltip_data.get_child(1).get_child(0).


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
