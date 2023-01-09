extends Object
class_name LinkedList

class LLNode:
	var next: LLNode
	var last: LLNode
	var value
	func _init(value, next: LLNode, last: LLNode):
		self.next = next
		self.last = last
		self.value = value

var start: LLNode
var end: LLNode

func _init(start: LLNode):
	self.start = start
	self.end = start.last

func remove(node: LLNode):
	node.last.next = node.next
	node.next.last = node.last

func insert(value, last: LLNode):
	var node = LLNode.new(value,last,last.next)
	last.next = node
	node.next.last = node

func remove_range(first: LLNode, last: LLNode):
	var curr: LLNode = first
	while curr != last:
		remove(curr)
		curr = curr.next

func insert_list(list: Array, last: LLNode):
	for i in range(list.size(),0,-1):
		insert(list[i-1],last)

func swap_range(first: LLNode, last: LLNode, list: Array):
	remove_range(first,last)
	var insert = first.last
	insert_list(list,insert)

func to_list():
	var res: Array = []
	var curr: LLNode = start
	while curr != end:
		res.append(curr)
	res.append(end)
	return res
