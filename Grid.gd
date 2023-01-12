extends Node2D


export var width : int
export var height : int
var blocks : Array

func block_from_pos(pos):
	for block in blocks:
		if block.x == pos.x and block.y == pos.y:
			return block
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(width):
		for j in range(height):
			var block = Block.new(i,j,randi()%2,1)
			block.connect("redraw",self,"redraw_tile")
			redraw_tile(block)
			blocks.append(block)


func redraw_tile(block):
	# add calculator
	$Houses.set_cell(block.x,block.y,block.party)
