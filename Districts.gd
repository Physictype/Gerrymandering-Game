extends TileMap

var districts: Array = []
export var district_size: int
export var district_margin: int
export var min_x: int
export var min_y: int
export var max_x: int
export var max_y: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_district_from_pos(position: Vector2):
	for district in districts:
		for block in district.blocks:
			if block.x == position.x and block.y == position.y:
				return district
	return null
