extends Control

onready var button = $Button

func _ready():
	ui_signals.register_tooltip(button,"\nWelcome to Godot! \n You can do basic text here\n")
