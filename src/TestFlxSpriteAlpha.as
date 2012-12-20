package  
{
	import org.flixel.*;
	import testFlxSpriteAlpha.*;

	public class TestFlxSpriteAlpha extends FlxState
	{
		private var mSpriteTest :FlxSprite;
		private var mSpriteTestBug :SpriteTestBug;
		
		override public function create():void {
			super.create();	
			
			mSpriteTest = new SpriteTest(100, 100);
			add(mSpriteTest);
			
			mSpriteTestBug = new SpriteTestBug(250, 100);
			add(mSpriteTestBug);

			add(new FlxText(100, 155, 50, "Expected"));
			add(new FlxText(250, 155, 50, "BUG"));
			
			var t:FlxText = new FlxText(50, 200, 300, "Both should fade out at the same pace, but the buggy one is way faster.");
			t.alignment = "center";
			add(t);
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}