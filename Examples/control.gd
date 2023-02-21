extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ink_reader_story_text_read(storytext):
	var label = Label.new()
	label.text = storytext
	$AspectRatioContainer/StoryReader.add_child(label)
	pass # Replace with function body.


func _on_ink_reader_choices_prepared(choicelist):
	for choice in choicelist:
		print(choice.Index)
	pass # Replace with function body.
