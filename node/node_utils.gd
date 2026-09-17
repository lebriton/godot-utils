class_name NodeUtils
extends Object


static func await_ready(node: Node) -> void:
	if not node.is_node_ready():
		await node.ready


static func when_ready(node: Node, callable: Callable) -> void:
	if node.is_node_ready():
		callable.call()
	else:
		node.ready.connect(callable, CONNECT_ONE_SHOT)
