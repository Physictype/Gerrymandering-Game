extends State
class_name UI_State

export var ui_on: Array

func _ready():
	for i in range(len(ui_on)):
		ui_on[i]=get_node(ui_on[i])

func enter(_msg := {}):
	for ui in ui_on:
		ui.show()


func exit():
	for ui in ui_on:
		ui.hide()
