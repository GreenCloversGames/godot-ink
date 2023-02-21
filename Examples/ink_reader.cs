using Godot;
using GodotInk;
using System.Collections.Generic;


public partial class ink_reader : Node
{
    [Export]
    private InkStory story;

	[Signal]
    public delegate void StoryTextReadEventHandler(string storytext);

	[Signal]
	public delegate void ChoicesPreparedEventHandler( Godot.Collections.Array choicelist);


    public override void _Ready()
    {
        ContinueStory();
    }

    private void ContinueStory()
    {
        string content = story.ContinueMaximally();
		EmitSignal("StoryTextRead", content);
		
		List<InkChoice> choices = story.CurrentChoices;
		Godot.Collections.Array gdchoices = new Godot.Collections.Array();
		foreach (InkChoice choice in choices){
			gdchoices.Add(choice);
		}
		EmitSignal("ChoicesPrepared", gdchoices);

        
    }
}