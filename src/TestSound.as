package  
{
	import org.flixel.*;

	public class TestSound extends FlxState
	{
		// Credits: http://www.flashkit.com/soundfx/Instruments/Guitar/Oh_Yeah_-Guitar_O-7431/index.php
		//[Embed(source = "../assets/sound.mp3")] private var SoundClass :Class;
		// Credits: The Eagles
		[Embed(source = "../assets/hotel-california.mp3")] private var SoundClass :Class;
		// If you liked that one, try also http://www.youtube.com/watch?v=h8dSoL13qpY 
		
		private var mSound	:FlxSound;
		private var mSprite :FlxSprite;
		
		public function TestSound() {
		}
		
		override public function create():void {
			super.create();	
			
			mSprite = new FlxSprite();
			add(mSprite);
						
			mSprite.followPath(new FlxPath([new FlxPoint(FlxG.width, 5), new FlxPoint(0, 5)]), 30, FlxObject.PATH_YOYO);
			
			mSound = new FlxSound();
			mSound.loadEmbedded(SoundClass, true);
			
			var dummySprite:FlxSprite = new FlxSprite(FlxG.width/2, 5);
			
			mSound.play();
			mSound.proximity(mSprite.x, mSprite.y, dummySprite, FlxG.width * (1/2));
			
			FlxG.mouse.show();
			add(mSound);
			
			add(new FlxText(5, FlxG.height/2 - 80, FlxG.width - 5, "Keys:\n\nP = pause\nR = resume\nA = play\nS = stop\nF = fadeIn\nG = fadeOut\nV = vol up\nC = vol down\nZ = stop sprite movement\n\nSound source is at top-middle of the screen, affected by the moving sprite proximity."));
		}
		
		override public function update():void
		{
			super.update();
			
			mSound.x = mSprite.x;
			mSound.y = mSprite.y;
			
			if (FlxG.keys.justPressed("P")) {
				mSound.pause();
			}
			
			if (FlxG.keys.justPressed("R")) {
				mSound.resume();
			} 
			
			if (FlxG.keys.justPressed("A")) {
				mSound.play();
			}
			
			if (FlxG.keys.justPressed("S")) {
				mSound.stop();
			}
			
			if (FlxG.keys.justPressed("F")) {
				mSound.fadeIn(2);
			}
			
			if (FlxG.keys.justPressed("G")) {
				mSound.fadeOut(2, true);
			}
			
			if (FlxG.keys.justPressed("V")) {
				mSound.volume += 0.1;
				FlxG.log("volume = " + mSound.getActualVolume());
			}
			
			if (FlxG.keys.justPressed("C")) {
				mSound.volume -= 0.1;
				FlxG.log("volume = " + mSound.getActualVolume());
			}
			
			if (FlxG.keys.justPressed("Z")) {
				mSprite.stopFollowingPath(true);
				mSprite.velocity.x = 0;
				mSprite.velocity.y = 0;
				mSprite.x = FlxG.width / 2;
			}
		}
	}

}