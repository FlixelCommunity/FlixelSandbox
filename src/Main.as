package 
{	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width="600", height="480", backgroundColor="#000000")]
	public class Main extends FlxGame 
	{
		
		public function Main() {
			super(300, 240, TestSound, 2);
			forceDebugger = true;
		}
	}
}