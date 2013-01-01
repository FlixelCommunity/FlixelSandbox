package  
{
	import core.FlxTest;
	import org.flixel.*;
	import testFlxSpriteAlpha.*;

	public class TestFlxSpriteAlpha extends FlxTest
	{
		private var mSpriteTest :SpriteTest;
		private var mSpriteTestBug :SpriteTest;
		
		override public function create():void 
		{
			super.create();	
			
			mSpriteTest = new SpriteTest(100, 100, false);
			add(mSpriteTest);
			
			mSpriteTestBug = new SpriteTest(250, 100, true);
			add(mSpriteTestBug);

			add(new FlxText(100, 155, 50, "Expected"));
			add(new FlxText(250, 155, 50, "BUG"));
			
			var t:FlxText = new FlxText(50, 200, 300, "Both should fade out at the same pace, \nbut the buggy one is way faster. \n\nPress ENTER to begin the fading or to reset the test.");
			t.alignment = "center";
			add(t);
			
			this.registerKey("ENTER", beginTest);
		}
		
		private var testRunning:Boolean = false;
		private function beginTest():void
		{
			if (testRunning)
			{
				testRunning = false;
				mSpriteTest.resetTest();
				mSpriteTestBug.resetTest();
				log("------------------------------------");
			}
			else
			{
				testRunning = true;
				mSpriteTest.enabled = true;
				mSpriteTestBug.enabled = true;
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}