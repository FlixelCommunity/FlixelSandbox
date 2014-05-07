package testFlxSpriteAlpha 
{
	import flash.geom.ColorTransform;
	import flash.display.BitmapData;
	import flixel.FlxG;
	import flixel.FlxSprite;
	
	public class SpriteTest extends FlxSprite
	{
		public var enabled:Boolean = false;
		private var bugged:Boolean = false;
		private var lifespan :Number = 0;
		
		public function SpriteTest(X :Number, Y :Number, bugged:Boolean = false) 
		{
			super(X, Y);
			// The bug happens when using makeGraphics() or loadGraphics()
			makeGraphic(50, 50, 0xffff0000);
			
			if (bugged)
			{
				this.bugged = true;
				// The line below seems to be the root of the bug. If we set "frame" to a non-existent one, the
				// sprite will fade out very quickly (way faster than expected).
				frame = 1;
			}
		}
		
		public function resetTest():void
		{
			this.enabled = false;
			this.alpha = 1;
			this.lifespan = 0;
		}
		
		public function get name():String
		{ return bugged ? "Bugged" : "Expected"; }
		
		//private var blinkCounter:Boolean = true;
		override public function update():void 
		{
			if (!enabled) return;
			
			lifespan += FlxG.elapsed;
			
			alpha = 1 - (lifespan / 15); // <--- this line...fade slowly over 15 seconds
			
			/*if (!bugged)
			{
				alpha = 1 - (lifespan / 15); // <--- this line...fade slowly over 15 seconds
			}
			else
			{
				//Alternate test to see if switching between two alpha values will also cause
				//  the bug to occurr. It does.
				//  Setting the alpha to the same value will not work, since the sprite won't
				//  be marked as "dirty" and redrawn.
				blinkCounter = !blinkCounter;
				alpha = blinkCounter ? 0.95 : 0.90;
			}*/
			
			FlxG.log(this.name + "\t" + alpha);

			if (alpha < 0.01) {
				FlxG.log(this.name + "\tEnded in " + lifespan + " ms");
				enabled = false;
			}
			
			super.update();
		}
		
		protected override function calcFrame():void
		{
			// See https://github.com/FlixelCommunity/flixel/issues/13#issuecomment-11786845
			//   for explanation on why bug is occurring
			
			var indexX:uint = _curIndex*frameWidth; // <---(1)
			var indexY:uint = 0;

			//Handle sprite sheets
			var widthHelper:uint = _flipped?_flipped:_pixels.width;
			if(indexX >= widthHelper) // <---(2)
			{
				indexY = uint(indexX/widthHelper)*frameHeight;
				indexX %= widthHelper;
			}
			
			//handle reversed sprites
			if(_flipped && (_facing == LEFT))
				indexX = (_flipped<<1)-indexX-frameWidth;
			
			//trace(name, indexX, indexY);
			
			//Update display bitmap
			_flashRect.x = indexX;
			_flashRect.y = indexY;
			framePixels.copyPixels(_pixels,_flashRect,_flashPointZero); // <---(3)
			_flashRect.x = _flashRect.y = 0;
			if(_colorTransform != null)
				framePixels.colorTransform(_flashRect,_colorTransform); // <---(4)
			if(_callback != null)
				_callback(((_curAnim != null)?(_curAnim.name):null),_curFrame,_curIndex);
			dirty = false;
		}
		
	}

}