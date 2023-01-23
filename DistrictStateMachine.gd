extends StateMachine

signal input_off


func _on_GameState_input_off():
	emit_signal("input_off")
