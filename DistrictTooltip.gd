extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()


func _on_DistrictIdle_not_over_district():
	print("EUEEsentfinpie")


func _on_DistrictIdle_over_district(district):
	print(district)
