extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var tex = (texture as NoiseTexture)
	var aaaaarrrrrrrraaaaaaaaayyyyyyyyyyy = []
	for i in range(tex.height):
		aaaaarrrrrrrraaaaaaaaayyyyyyyyyyy.append([])
		for j in range(tex.width):
			aaaaarrrrrrrraaaaaaaaayyyyyyyyyyy[i-1].append(tex.noise.get_noise_2d(j+1,i+1))
	print(aaaaarrrrrrrraaaaaaaaayyyyyyyyyyy[0][0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
