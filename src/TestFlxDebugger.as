package  
{
	import core.FlxTest;
	import flash.display.Sprite;
	import flixel.system.debug.Vis;
	import flixel.util.*;
	import flixel.ui.*;
	import flixel.*;

	public class TestFlxDebugger extends FlxTest
	{
		private var mButton :FlxButton;
		private var mMyOverlay :Sprite;
		
		override public function create():void 
		{
			mButton = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Toggle", toggleDebugger);
			add(mButton);
			
			
			mMyOverlay = new Vis();
			FlxG.debugger.overlays.addChild(mMyOverlay);
			
			super.create();
		}
		
		private function toggleDebugger() :void
		{
			FlxG.debugger.toggleVisility();
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("D"))
			{
				FlxG.debugger.show(true);
				FlxG.log("FlxG.debugger.show(true)");
			}
			
			if (FlxG.keys.justPressed("H"))
			{
				FlxG.debugger.hide();
			}
			
			if (FlxG.keys.justPressed("T"))
			{
				FlxG.debugger.toggleVisility();
			}
		}
	}

}