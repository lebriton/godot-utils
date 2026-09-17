class_name SignalGroup
extends RefCounted

signal complete

var _signals: Array[Signal] = []


func add(sig: Signal) -> void:
	_signals.append(sig)


func add_array(array: Array[Signal]) -> void:
	_signals.append_array(array)


func all() -> Array[Signal]:
	return await _run(_signals.size())


func any() -> Array[Signal]:
	return await _run(1)


func _init(signals: Array = []) -> void:
	_signals.assign(signals)


func _on_signal_completed(completion_order: Array[Signal], quota: int) -> void:
	if completion_order.size() < quota:
		completion_order.append(completion_order.size())
	if completion_order.size() == quota:
		complete.emit()


func _run(quota: int) -> Array[Signal]:
	assert(_signals.size() > 0, "SignalGroup needs at least one signal")

	var completion_order: Array[Signal] = []
	var callables: Array[Callable] = []

	for sig in _signals:
		var cb := _on_signal_completed.bind(completion_order, quota)
		callables.append(cb)
		sig.connect(cb, CONNECT_ONE_SHOT)

	await complete

	for i in _signals.size():
		var cb := callables[i]
		if _signals[i].is_connected(cb):
			_signals[i].disconnect(cb)
	return completion_order
