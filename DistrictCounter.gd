extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().get_node("Node2D/Grid/Districts").connect("edited",self,"update_ui")
	
func update_ui(party_comp):
	get_child(0).text = str(party_comp[0])
	get_child(2).text = str(party_comp[1])
	get_child(4).text = str(party_comp[2])
