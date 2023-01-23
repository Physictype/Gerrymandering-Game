extends State
class_name GameStatePlanning


func _on_PlayButton_button_down():
	state_machine.transition_to("GameStateRunning")
