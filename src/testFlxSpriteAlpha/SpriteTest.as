package testFlxSpriteAlpha 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class SpriteTest extends FlxSprite
	{
		public var enabled:Boolean = false;
		private var name:String;
		private var lifespan :Number = 0;
		
		public function SpriteTest(X :Number, Y :Number, bugged:Boolean = false) 
		{
			super(X, Y);
			// The bug happens when using makeGraphics() or loadGraphics()
			makeGraphic(50, 50, 0xffff0000);
			
			if (bugged)
			{
				// The line below seems to be the root of the bug. If we set "frame" to a non-existent one, the
				// sprite will fade out very quickly (way faster than expected).
				frame = 1;
				this.name = "Bugged";
			}
			else
			{
				this.name = "Expected";
			}
		}
		
		public function resetTest():void
		{
			this.enabled = false;
			this.alpha = 1;
			this.lifespan = 0;
		}
		
		override public function update():void 
		{
			if (!enabled) return;
			
			lifespan += FlxG.elapsed;
			alpha = 1 - (lifespan / 15); // <--- this line...fade slowly over 15 seconds
			FlxG.log(this.name + "\t" + alpha);

			if (alpha < 0.01) {
				FlxG.log(this.name + "\tEnded in " + lifespan + " ms");
				enabled = false;
			}
			
			super.update();
		}
		
	}

}