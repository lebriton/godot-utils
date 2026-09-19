class_name VectorUtils
extends Object


static func to_vector2(v: Variant) -> Vector2:
	if v is Vector2:
		return v
	if v is Vector2i:
		return Vector2(v)
	if v is Vector3:
		return Vector2(v.x, v.y)
	if v is Vector3i:
		return Vector2(v.x, v.y)
	return Vector2.ZERO


static func to_vector2i(v: Variant) -> Vector2i:
	if v is Vector2i:
		return v
	if v is Vector2:
		return Vector2i(v)
	if v is Vector3i:
		return Vector2i(v.x, v.y)
	if v is Vector3:
		return Vector2i(v.x, v.y)
	return Vector2i.ZERO


static func to_vector3(v: Variant) -> Vector3:
	if v is Vector3:
		return v
	if v is Vector3i:
		return Vector3(v)
	if v is Vector2:
		return Vector3(v.x, v.y, 0.0)
	if v is Vector2i:
		return Vector3(v.x, v.y, 0)
	return Vector3.ZERO


static func to_vector3i(v: Variant) -> Vector3i:
	if v is Vector3i:
		return v
	if v is Vector3:
		return Vector3i(v)
	if v is Vector2i:
		return Vector3i(v.x, v.y, 0)
	if v is Vector2:
		return Vector3i(v.x, v.y, 0)
	return Vector3i.ZERO
