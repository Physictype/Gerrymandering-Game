extends Node2D


export var width : int
export var height : int
export var change_odds : float
var blocks : Array
var positions: Array

func block_from_pos(pos):
	for block in blocks:
		if block.x == pos.x and block.y == pos.y:
			return block
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_island()
	$PartyNoise.texture.width = width
	$PartyNoise.texture.height = height
	for i in range(len(positions)):
		var block = Block.new(positions[i].x,positions[i].y,$PartyNoise.texture.noise.get_noise_2d((i%512)+1,(i/512)+1)>0,1)
		block.connect("redraw",self,"redraw_tile")
		redraw_tile(block)
		blocks.append(block)

func generate_island():
	var start = Vector2(256,256)
	positions = propagate(start)
func propagate(vec):
	if $IslandNoise.texture.noise.get_noise_2d(vec.x,vec.y)<0.75:
		return []
	var res = []
	res.append_array(propagate(vec+Vector2(1,0)))
	res.append_array(propagate(vec+Vector2(-1,0)))
	res.append_array(propagate(vec+Vector2(0,1)))
	res.append_array(propagate(vec+Vector2(0,-1)))
	return unique(res)
func unique(arr):
	var res = []
	for ell in arr:
		if not res.has(ell):
			res.append(ell)

func redraw_tile(block):
	# add calculator
	$Houses.set_cell(block.x,block.y,block.party)


func _on_SwitchTimer_timeout():
	for i in range(len(blocks)):
		if randf() < change_odds:
			blocks[i].party = 1-blocks[i].party
			redraw_tile(blocks[i])


func _on_GameState_input_off():
	pass # Replace with function body.
