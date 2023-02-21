extends VBoxContainer

@export var ink_file : Resource

@onready var _inkstory = load("res://addons/GodotInk/Src/InkStory.cs").new()
var inkstory

# Called when the node enters the scene tree for the first time.
func _ready():
	_inkstory.rawStory = ink_file
	print(_inkstory.get_class())
	continue_story()
	pass # Replace with function body.

func continue_story():
	var content = Label.new()
	content.text = _inkstory.ContinueMaximally()
	add_child(content)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
