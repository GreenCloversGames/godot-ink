extends Control

@onready var inkreader = $InkReader

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ink_reader_story_text_read(storytext):
	var label = Label.new()
	label.text = storytext
	#label.autowrap_mode  = TextServer.AUTOWRAP_WORD_SMART
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	$AspectRatioContainer/ScrollContainer/StoryReader.add_child(label)
	pass # Replace with function body.


func _on_ink_reader_choices_prepared(choicelist):
	for choice in choicelist:
		var button = Button.new()
		button.text = choice.GetText()
		button.add_to_group("choice button")
		button.pressed.connect(_choice_made.bind(choice.GetIndex()))
		$AspectRatioContainer/ScrollContainer/StoryReader.add_child(button)
	
	pass # Replace with function body.

func _choice_made(index):
	await get_tree().process_frame
	for button in get_tree().get_nodes_in_group("choice button"):
		button.queue_free()
	inkreader.MakeChoice(index)
	#inkreader.ContinueStory()
