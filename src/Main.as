package 
{	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width="1000", height="480", backgroundColor="#000000")]
	public class Main extends FlxGame 
	{
		
		public function Main() {
			super(500, 240, TestSound, 2);
			forceDebugger = true;
		}
	}
}