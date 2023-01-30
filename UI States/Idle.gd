extends UI_State
class_name UIIdle

func handle_input(_event: InputEvent):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	if Input.is_action_just_pressed("left_button_clicked"):
		print("E!")
		state_machine.transition_to("UIDrawing")


func physics_update(_delta: float):
	pass


func enter(_msg := {}):
	.enter()
	


func exit():
	.exit()
