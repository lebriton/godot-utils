class_name Distance3i
extends RefCounted

var _delta := Vector3i.ZERO


static func from_coords(
	from_x: int, from_y: int, from_z: int, to_x: int, to_y: int, to_z: int
) -> Distance3i:
	return Distance3i.new(Vector3i(to_x - from_x, to_y - from_y, to_z - from_z))


static func from_delta(delta: Vector3i) -> Distance3i:
	return Distance3i.new(delta)


static func from_vecs(from: Vector3i, to: Vector3i) -> Distance3i:
	return Distance3i.new(to - from)


func _init(delta: Vector3i) -> void:
	_delta = delta


func manhattan() -> int:
	return absi(_delta.x) + absi(_delta.y) + absi(_delta.z)


func x(absolute: bool = false) -> int:
	return absi(_delta.x) if absolute else _delta.x


func y(absolute: bool = false) -> int:
	return absi(_delta.y) if absolute else _delta.y


func z(absolute: bool = false) -> int:
	return absi(_delta.z) if absolute else _delta.z
