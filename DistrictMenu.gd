extends VBoxContainer

signal select_district

export var district_num: int


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.text = "District "+str(district_num)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	emit_signal("select_district")
