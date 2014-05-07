package  
{
	import core.FlxTest;
	import flixel.*;

	public class TestFlxSpriteDrawLine extends FlxTest
	{
		override public function create():void {
			super.create();	
			//                                       AARRGGBB    AARRGGBB
			this.add(new FlxBox(32, 32, 64, 64, 8, 0xFFFF0000, 0x0000FF00));
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}

import flixel.*;

class FlxBox extends FlxSprite
{
	public function FlxBox(X:Number, Y:Number, width:Number, height:Number, lineWidth:uint, fillColor:uint, lineColor:uint)
	{
		// let parent handle basic construction and placement
		super(X, Y);

		// create blank box graphic
		makeGraphic(width, height);

		// flood fill
		this.fill(fillColor);

		// Create outline with given dimensions
		for (var i:int = 0; i < lineWidth; ++i)
		{
			// top and bottom
			drawLine(0, (0 + i), width, (0 + i), lineColor);
			drawLine(0, (height - i), width, (height - i), lineColor);

			// left and right
			drawLine((0 + i), 0, (0 + i), height, lineColor);
			drawLine((width - i), 0, (width - i), height, lineColor);
		}
	}
}