class_name ChangeResult
extends RefCounted

var amount: int
var applied: int
var overflow: int


func _init(amount: int = 0, applied: int = 0, overflow: int = 0) -> void:
	self.amount = amount
	self.applied = applied
	self.overflow = overflow
