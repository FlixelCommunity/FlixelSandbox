package  
{
	import core.FlxTest;
	import flixel.plugin.interactivedebug.InteractiveDebug;
	import flixel.plugin.replay.FlxReplay;
	import flixel.plugin.timer.FlxTimer;
	import flixel.util.FlxPath;
	import flixel.util.FlxPoint;
	
	import flixel.ui.*;
	import flixel.*;
	import flixel.util.FlxSignal;

	public class TestFlxPath extends FlxTest
	{
		private var mSprite :FlxSprite;
		private var mPath :FlxPath;
		
		override public function create():void 
		{
			mPath = new FlxPath([new FlxPoint(10, 10), new FlxPoint(50, 90), new FlxPoint(150, 110),  new FlxPoint(200, 50)]);
			mSprite = new FlxSprite();
			
			mSprite.followPath(mPath, 50, FlxObject.PATH_YOYO);
			add(mSprite);
			
			FlxG.addPlugin(new InteractiveDebug());
			FlxG.addPlugin(new FlxReplay());
			
			super.create();
		}
				
		override public function update():void
		{
			super.update();
		}
	}

}