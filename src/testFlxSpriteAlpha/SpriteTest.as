package testFlxSpriteAlpha 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class SpriteTest extends FlxSprite
	{	
		private var lifespan :Number = 0;
		
		public function SpriteTest(X :Number, Y :Number) 
		{
			super(X, Y);
			makeGraphic(50, 50, 0xffff0000);
			//loadGraphic(ImgDefault, true);
			
			addAnimation("idle", [0, 1]);
			play("idle");
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