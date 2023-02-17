extends UI_State
class_name UIIdle

onready var district_state_machine = get_tree().get_root().get_node("Node2D/Grid/Districts/StateMachine")

func handle_input(_event: InputEvent):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	if district_state_machine.state.name != "DistrictIdle":
		state_machine.transition_to("UIDrawing")


func physics_update(_delta: float):
	pass


func enter(_msg := {}):
	.enter()
	


func exit():
	.exit()
