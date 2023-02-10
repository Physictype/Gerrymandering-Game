extends Camera2D

export var speed: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
		if outside_border():
			position.y += speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
		if outside_border():
			position.y -= speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		if outside_border():
			position.x += speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		if outside_border():
			position.x -= speed * delta
	
func outside_border():
	var grid = get_parent().get_child(0)
	return not grid.positions.has(grid.get_child(0).world_to_map(position))
