extends HBoxContainer


onready var districts = get_tree().get_root().get_node("Node2D/Grid/Districts")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	var party_comp = districts.get_party_comp()
	get_child(0).text = str(party_comp[0])
	get_child(2).text = str(party_comp[1])
	get_child(4).text = str(party_comp[2])
	get_child(6).text = str(districts.districts.size())
