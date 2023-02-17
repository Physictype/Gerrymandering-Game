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
	randomize()
	get_child(3).texture.noise.seed = randi()
	positions = generate_island()
	for i in range(len(positions)):
		var block = Block.new(positions[i].x,positions[i].y,$PartyNoise.texture.noise.get_noise_2d((i%512)+1,(i/512)+1)>0,1)
		block.connect("redraw",self,"redraw_tile")
		redraw_tile(block)
		blocks.append(block)

func generate_island():
	var res = [Vector2(0,0)]
	for i in range(10):
		if randi()%2:
			for j in range(len(res)):
				var point = res[j]
				res.append(point+Vector2(0,1))
				res.append(point+Vector2(0,-1))
				res.append(point+Vector2(1,0))
				res.append(point+Vector2(-1,0))
		else:
			for j in range(len(res)):
				var point = res[j]
				var rand = randi()%4
				if rand == 0:
					res.append(point+Vector2(0,1))
				elif rand == 1:
					res.append(point+Vector2(0,-1))
				elif rand == 2:
					res.append(point+Vector2(1,0))
				else:
					res.append(point+Vector2(-1,0))
		res = unique(res)
	return res
func unique(arr):
	var res = []
	for ell in arr:
		if not res.has(ell):
			res.append(ell)
	return res

func redraw_tile(block):
	# add calculator
	$Houses.set_cell(block.x,block.y,block.party*2)


func _on_SwitchTimer_timeout():
	for i in range(len(blocks)):
		if randf() < change_odds:
			blocks[i].party = 1-blocks[i].party
			redraw_tile(blocks[i])


func _on_GameState_input_off():
	pass # Replace with function body.
