package 
{	
	import core.FlxTest;
	import core.SelectTestMenu;
	import flixel.FlxG;
	import flixel.FlxGame;
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	public class Main extends FlxGame 
	{
		
		public function Main() 
		{
			FlxTest.register(TestFlxGroupUpdate);
			FlxTest.register(TestFlxSpriteAlpha);
			FlxTest.register(TestFlxGroupSort);
			FlxTest.register(TestSound);
			FlxTest.register(TestText);
			FlxTest.register(TestTileMap);
			FlxTest.register(TestAngles);
			FlxTest.register(TestFlxSpriteDrawLine);
			FlxTest.register(TestCameraJitters);
			FlxTest.register(TestFlxRandom);
			//FlxTest.register(TestFlxDebugger);
			FlxTest.register(TestFlxSignal);
			
			super(400, 300, SelectTestMenu, 2);
			FlxG.debug = true;
		}
	}
}