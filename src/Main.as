package 
{	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	public class Main extends FlxGame 
	{
		
		public function Main() {
			super(400, 300, TestFlxSpriteAlpha, 2);
			forceDebugger = true;
		}
	}
}