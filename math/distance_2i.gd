class_name Distance2i
extends RefCounted

var _delta := Vector2i.ZERO


static func from_coords(from_x: int, from_y: int, to_x: int, to_y: int) -> Distance2i:
	return Distance2i.new(Vector2i(to_x - from_x, to_y - from_y))


static func from_delta(delta: Vector2i) -> Distance2i:
	return Distance2i.new(delta)


static func from_vecs(from: Vector2i, to: Vector2i) -> Distance2i:
	return Distance2i.new(to - from)


func _init(delta: Vector2i) -> void:
	_delta = delta


func manhattan() -> int:
	return absi(_delta.x) + absi(_delta.y)


func x(absolute: bool = false) -> int:
	return absi(_delta.x) if absolute else _delta.x


func y(absolute: bool = false) -> int:
	return absi(_delta.y) if absolute else _delta.y
