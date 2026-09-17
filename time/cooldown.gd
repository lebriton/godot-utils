class_name Cooldown
extends Resource

@export_custom(PROPERTY_HINT_NONE, "suffix:ms") var duration := 1000

var _last_time := -1


func is_ready() -> bool:
	if _last_time < 0:
		return true
	return Time.get_ticks_msec() - _last_time >= duration


func reset() -> void:
	_last_time = Time.get_ticks_msec()
