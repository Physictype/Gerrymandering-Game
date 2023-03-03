extends TileMap

signal edited(party_comp)

var districts: Array = []
export var district_size: int
export var district_margin: int
export var min_x: int
export var min_y: int
export var max_x: int
export var max_y: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func get_district_from_pos(position: Vector2):
	for district in districts:
		for block in district.blocks:
			if block.x == position.x and block.y == position.y:
				return district
	return null

func get_party_comp():
	var r = 0
	var b = 0
	var e = 0
	for district in districts:
		var party = district.calc_party()
		if party==-1:
			b += 1
		elif party==1:
			r += 1
		elif party==0:
			e += 1
	return [b,e,r]

func update_districts():
	get_child(1).update_districts()
