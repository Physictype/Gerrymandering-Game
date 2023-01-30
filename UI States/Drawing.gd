extends UI_State
class_name UIDrawing

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _enter(msg := {}):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	if Input.is_action_just_pressed("escape"):
		state_machine.transition_to("UIIdle")
