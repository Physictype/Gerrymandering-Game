extends Reference
class_name District

var blocks: Array
var size: int
var margin: int

func _init(blocks: Array, size: int, margin: int):
	self.blocks = blocks
	self.size = size
	self.margin = margin

func get_size():
	var sum = 0
	for block in blocks:
		sum += block.population
	return sum

func check_valid():
	return abs(get_size()-size) <= margin

func num_red():
	var sum = 0
	for block in blocks:
		if block.party == 1:
			sum += block.population
	return sum

func num_blue():
	var sum = 0
	for block in blocks:
		if block.party == 0:
			sum += block.population
	return sum

func calc_party():
	var sum = 0
	for block in blocks:
		sum += block.party*block.population
	return 0 if sum == float(blocks.size())/2.0 else (1 if sum > float(blocks.size())/2.0 else -1) # add equal
