extends Object
class_name District

var blocks: Array
var size: int
var margin: int

func _init(blocks: Array, size: int, margin: int):
	self.blocks = blocks
	self.size = size
	self.margin = margin

func get_size():
	for block in blocks:
		size += block.population
	return size

func check_valid():
	return abs(get_size()-size) <= margin

func calc_party():
	var sum = 0
	for block in blocks:
		sum += block.party*block.population
	print(sum)
	return int(sum > blocks.size()/2) # add equal
