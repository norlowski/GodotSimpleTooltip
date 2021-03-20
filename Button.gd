extends Control

onready var button = $Button

func _ready():
	ui_signals.register_tooltip(button,"Welcome to Godot! \n\n You can do basic text here\n\n")
