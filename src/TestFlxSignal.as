package  
{
	import core.FlxTest;
	import flixel.plugin.timer.FlxTimer;
	import flixel.util.FlxPath;
	import flixel.util.FlxPoint;
	
	import flixel.ui.*;
	import flixel.*;
	import flixel.util.FlxSignal;

	public class TestFlxSignal extDends FlxTest
	{
		private var mDummySignal :FlxSignal;
		private var mButton :FlxButton;
		private var mPath :FlxPath;
		
		override public function create():void 
		{
			mDummySignal = new FlxSignal();
			mDummySignal.add(myCallback);
			mDummySignal.add(myOtherCallback);
		
			FlxG.signals.reset.add(callbackReset);
			
			mButton = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Dispatch", dispatchSignals);
			add(mButton);
			
			mDummySignal.removeAll();
			
			mPath = new FlxPath([new FlxPoint(10, 10), new FlxPoint(50, 50), new FlxPoint(80, 100)]);
			
			var timer :FlxTimer = new FlxTimer();
			
			timer.start(2, 1, function() :void { FlxG.log("timer is off!"); } );
			
			super.create();
		}
		
		private function dispatchSignals() :void
		{
			FlxG.resetGame();
			mDummySignal.dispatch();
		}
		
		private function callbackReset() :void
		{
			FlxG.log("Flixel just reset the game.");
		}
		
		private function myCallback() :void
		{
			FlxG.log("hello from myCallback()!");
		}
		
		private function myOtherCallback() :void
		{
			FlxG.log("hello from myOtherCallback()!");
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("F"))
			{
				FlxG.log("mAnimatedSprite.frame = 0 (first)");
			}
		}
	}

}