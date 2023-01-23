extends State
class_name GameStateRunning

func enter(_msg := {}):
	emit_signal("entered")
