extends Object
class_name Block

signal redraw(block)

var party: int
var population: int
var x: int
var y: int

enum Party {
	Blue,
	Red
}

func _init(x:int, y:int, party: int, population:int):
	self.x=x
	self.y=y
	self.party = party
	self.population = population
