@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("IntervalSystem", "res://addons/interval_system/interval_system.gd")


func _exit_tree() -> void:
	remove_autoload_singleton("IntervalSystem")
