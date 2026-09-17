class_name TextTypewriterEffect
extends Node

signal animation_finished
signal character_typed(character: String)

const DEFAULT_CPS := 30.0
const DEFAULT_PUNCTUATION_DELAY := 0.5
const PUNCTUATION_CHARS := [".", "!", "?", ",", ";", ":"]

@export_group("Required")
@export var label: RichTextLabel

@export_group("Parameters")
## Characters per second for typewriter text effect
@export_range(0.001, 1000.0, 0.001, "suffix:s") var cps := DEFAULT_CPS
## Delay after punctuation characters (seconds)
@export_range(0.001, 10.0, 0.001, "suffix:s") var punctuation_delay := DEFAULT_PUNCTUATION_DELAY
@export var autostart := false

var _is_animating := false
var _skipped := false


func _ready() -> void:
	if autostart:
		animate()


func is_animating() -> bool:
	return _is_animating


func animate() -> void:
	_is_animating = true
	_skipped = false
	label.visible_characters = 0
	for i in range(label.get_total_character_count()):
		var character := String(label.get_parsed_text()[i])

		label.visible_characters = i + 1
		character_typed.emit(character)

		var delay := punctuation_delay if character in PUNCTUATION_CHARS else 1.0 / cps
		await get_tree().create_timer(delay).timeout
		if _skipped:
			break
	_is_animating = false
	animation_finished.emit()


func skip() -> void:
	_skipped = true
	label.visible_characters = label.get_total_character_count()
