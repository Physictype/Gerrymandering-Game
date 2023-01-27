extends State
class_name GameStatePlanning

func _on_PlayButton_pressed():
	state_machine.transition_to("GameStateRunning")
