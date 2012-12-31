package  
{
	import core.FlxTest;
	import org.flixel.*;
	
	/**
	 * This code tests FlxText and its sometime blurry behavior.
	 */
	public class TestText extends FlxTest
	{
		private var text :FlxText;
		private var text2 :FlxText;
		
		override public function create():void 
		{
			super.create();
			
			var x:Number = FlxG.width * 0.15, y:Number = 30, width: Number = FlxG.width * 0.7;
			
			var textBackground :FlxSprite = new FlxSprite(x, y);
			textBackground.makeGraphic(width, 15, 0x33ff0000);
			add(textBackground);
			
			text = new FlxText(x, y, width, "Single line text: Flixel is a outstanding!");
			text.alignment = "center";
			add(text);
			
			var textBackground2 :FlxSprite = new FlxSprite(int(x), int(y) + 100);
			textBackground2.makeGraphic(width, 90, 0x33ff0000);
			add(textBackground2);
			
			text2 = new FlxText(x, y + 100, width, "Multi-line text: Flixel is a free Actionscript (Flash) library that I distilled from a variety of Flash games that I've worked on over the last couple years, including Gravity Hook, Fathom and Canabalt.\n\nIt's primary function is to provide some useful base classes that you can extend to make your own game objects.");
			text2.alignment = "center";
			add(text2);
			
			add(new FlxText(5, FlxG.height - 20, FlxG.width, "Press C (center), L (left), R (right) or J (justify) to change alignment."));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.justPressed("C")) {
				text.alignment = "center";
				text2.alignment = "center";
			}
			
			if (FlxG.keys.justPressed("J")) {
				text.alignment = "justify";
				text2.alignment = "justify";
			}
			
			if (FlxG.keys.justPressed("L")) {
				text.alignment = "left";
				text2.alignment = "left";
			}
			
			if (FlxG.keys.justPressed("R")) {
				text.alignment = "right";
				text2.alignment = "right";
			}
		}
	}
}