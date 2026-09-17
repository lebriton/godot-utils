class_name TweenUtils
extends Object


static func delete_tween(node: Node, meta_name: StringName) -> void:
	var tween := MetaUtils.safe_get_meta(node, meta_name) as Tween
	if tween == null:
		return
	tween.kill()
	node.remove_meta(meta_name)


static func get_or_create_tween(
	node: Node,
	meta_name: StringName,
	kill: bool = true,
) -> Tween:
	var tween := MetaUtils.safe_get_meta(node, meta_name) as Tween
	if tween != null and tween.is_valid():
		if kill:
			tween.kill()
		else:
			return tween

	tween = node.create_tween()
	node.set_meta(meta_name, tween)
	return tween


static func is_tween_running(tween: Tween) -> bool:
	return tween != null and tween.is_running()


static func kill_tween_if_running(tween: Tween) -> void:
	if is_tween_running(tween):
		tween.kill()
