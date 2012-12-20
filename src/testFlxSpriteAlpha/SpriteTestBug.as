package testFlxSpriteAlpha 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class SpriteTestBug extends FlxSprite
	{		
		private var lifespan :Number = 0;
		
		public function SpriteTestBug(X :Number, Y :Number) 
		{
			super(X, Y);
			// The bug happens when using makeGraphics() or loadGraphics()
			makeGraphic(50, 50, 0xffff0000);
			//loadGraphic(ImgDefault, true);
			
			// These two lines seem to be irrelevant to the bug. Uncommenting them will
			// not trigger or prevent the unusual behavior.
			//addAnimation("idle", [0, 1]);
			//play("idle");
			
			// The line below seems to be the root of the bug. If we set "frame" to a non-existent one, the
			// sprite will fade out very quickly (way faster than expected).
			frame = 1;
		}
		
		override public function update():void {
			if (frame < frames) {
			//	frame = frame + 1;
			}
			
			lifespan += FlxG.elapsed;

			if (lifespan > 3) { // 3 seconds before starting fade
				alpha = (1 - ((lifespan - 3) / 15)); // <--- this line...fade slowly over 15 seconds
			}

			if (alpha < 0.01) {
				//FlxG.log("End!");
			}
			
			super.update();
		}
	}
}