extends State
class_name GameStatePlanning



func _on_CanvasLayer_play():
	state_machine.transition_to("GameStateRunning")
