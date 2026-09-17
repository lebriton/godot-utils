class_name DeltaCooldown
extends Resource

@export_custom(PROPERTY_HINT_NONE, "suffix:ms") var duration := 1000

var _last_time := -1


func get_elapsed(update: bool = true) -> int:
	var current_time := Time.get_ticks_msec()

	if _last_time < 0:
		_last_time = current_time
		return 0

	var delta := current_time - _last_time

	if update:
		_last_time = current_time

	return delta
