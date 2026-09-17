class_name PrototypeCloner
extends Node

@export_group("Required")
@export var prototype: Node
@export var container: Node

@export_group("Parameters")
@export var auto_detach_prototype := false

var _copies: Array[Node] = []:
	get():
		_copies = _copies.filter(is_instance_valid)
		return _copies


func clear_copies():
	for copy in _copies:
		copy.queue_free()
	_copies.clear()


func clone() -> Node:
	var copy = prototype.duplicate()
	container.add_child(copy)
	_copies.append(copy)
	return copy


func detach_prototype():
	prototype.get_parent().remove_child(prototype)


func get_copies() -> Array[Node]:
	return _copies


func _ready():
	if auto_detach_prototype:
		NodeUtils.when_ready(prototype, detach_prototype)
