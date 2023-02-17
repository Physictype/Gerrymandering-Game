extends UI_State
class_name UIDrawing

onready var district_state_machine = get_tree().get_root().get_node("Node2D/Grid/Districts/StateMachine")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _enter(msg := {}):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	if district_state_machine.state.name == "DistrictIdle":
		state_machine.transition_to("UIIdle")
