class_name MetaUtils
extends Object


static func safe_get_meta(obj: Object, name: StringName, default: Variant = null) -> Variant:
	if obj.has_meta(name):
		return obj.get_meta(name, default)
	return null
