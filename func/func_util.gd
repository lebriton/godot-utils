class_name FuncUtil
extends Object


static func call_if_exists(object: Object, method: StringName, args: Array = []) -> Variant:
	if not object or not object.has_method(method):
		return null
	return object.callv(method, args)


static func set_if_exists(object: Object, property: StringName, value: Variant) -> bool:
	if not object or not (property in object):
		return false
	object.set(property, value)
	return true
