package  
{
	import flixel.util.FlxPoint;
	import core.FlxTest;

	import flixel.*;
	import flixel.ui.FlxText;
	
	/**
	 * This code tests FlxText and its sometime blurry behavior.
	 */
	public class TestAngles extends FlxTest
{
		
		override public function create():void 
		{
			super.create();
			
			degreesText = new FlxText(5, FlxG.height - 20, FlxG.width, "");
			add(degreesText);
			
			center = new FlxSprite();
			center.x = (FlxG.width / 2);
			center.y = (FlxG.height / 2);
			add(center);
			
			mover = new FlxSprite();
			halfMoverSize = mover.width / 2;
			mover.x = center.x + 0;
			mover.y = center.y - moverRadius;
			add(mover);
			
			this.r = 0;
			
			add(new FlxText(5, FlxG.height - 30, FlxG.width, "Press L to increase rotation, press K to decrease rotation."));
		}
		
		private var degreesText:FlxText;
		private var center:FlxSprite;
		private var mover:FlxSprite;	
		private const moverRadius:Number = 50;
		private var halfMoverSize:Number;
		
		private var _r:Number = 0;
		public function get r():Number
		{ return _r; }
		public function set r(value:Number):void
		{
			var angleChanged:Number = value - _r;
			
			var pt:FlxPoint = rotatePoint(mover.x, mover.y, center.x, center.y, angleChanged, pt);
			mover.x = pt.x;
			mover.y = pt.y;
			
			_r = value;
			
			var numDegrees:Number = getAngle(new FlxPoint(center.x, center.y), new FlxPoint(mover.x, mover.y));
			degreesText.text = "Set to " + _r + " degrees. `getAngle()` returns " + numDegrees.toFixed(2) + " degrees.";
			center.angle = numDegrees;
		}
		
		override public function update():void 
		{
			super.update();
			
			//*
			if (FlxG.keys.K) {
				r -= 5;
			}
			
			if (FlxG.keys.L) {
				r += 5;
			}
			/*/
			if (FlxG.keys.justPressed("K")) {
				r -= 360;
			}
			
			if (FlxG.keys.justPressed("L")) {
				r += 360;
			}//*/
			
		}
		
		
		/**
		 * Rotates a point in 2D space around another point by the given angle.
		 * 
		 * @param	X		The X coordinate of the point you want to rotate.
		 * @param	Y		The Y coordinate of the point you want to rotate.
		 * @param	PivotX	The X coordinate of the point you want to rotate around.
		 * @param	PivotY	The Y coordinate of the point you want to rotate around.
		 * @param	Angle	Rotate the point by this many degrees.
		 * @param	Point	Optional <code>FlxPoint</code> to store the results in.
		 * 
		 * @return	A <code>FlxPoint</code> containing the coordinates of the rotated point.
		 */
		static public function rotatePoint(X:Number, Y:Number, PivotX:Number, PivotY:Number, Angle:Number,Point:FlxPoint=null):FlxPoint
		{
			var sin:Number = 0;
			var cos:Number = 0;
			var radians:Number = Angle * -0.017453293;
			while (radians < -3.14159265)
				radians += 6.28318531;
			while (radians >  3.14159265)
				radians = radians - 6.28318531;
			
			if (radians < 0)
			{
				sin = 1.27323954 * radians + .405284735 * radians * radians;
				if (sin < 0)
					sin = .225 * (sin *-sin - sin) + sin;
				else
					sin = .225 * (sin * sin - sin) + sin;
			}
			else
			{
				sin = 1.27323954 * radians - 0.405284735 * radians * radians;
				if (sin < 0)
					sin = .225 * (sin *-sin - sin) + sin;
				else
					sin = .225 * (sin * sin - sin) + sin;
			}
			
			radians += 1.57079632;
			if (radians >  3.14159265)
				radians = radians - 6.28318531;
			if (radians < 0)
			{
				cos = 1.27323954 * radians + 0.405284735 * radians * radians;
				if (cos < 0)
					cos = .225 * (cos *-cos - cos) + cos;
				else
					cos = .225 * (cos * cos - cos) + cos;
			}
			else
			{
				cos = 1.27323954 * radians - 0.405284735 * radians * radians;
				if (cos < 0)
					cos = .225 * (cos *-cos - cos) + cos;
				else
					cos = .225 * (cos * cos - cos) + cos;
			}
			
			var dx:Number = X-PivotX;
			var dy:Number = PivotY-Y;
			if(Point == null)
				Point = new FlxPoint();
			Point.x = PivotX + cos*dx - sin*dy;
			Point.y = PivotY - sin*dx - cos*dy;
			return Point;
		};
		
		/**
		 * Calculates the angle between two points.  0 degrees points straight up.
		 * 
		 * @param	Point1		The X coordinate of the point.
		 * @param	Point2		The Y coordinate of the point.
		 * 
		 * @return	The angle in degrees, between -180 and 180.
		 */
		static public function getAngle(Point1:FlxPoint, Point2:FlxPoint):Number
		{
			var x:Number = Point2.x - Point1.x;
			var y:Number = Point2.y - Point1.y;
			if((x == 0) && (y == 0))
				return 0;
			var c1:Number = 3.14159265 * 0.25;
			var c2:Number = 3 * c1;
			var ay:Number = (y < 0)?-y:y;
			var angle:Number = 0;
			if (x >= 0)
				angle = c1 - c1 * ((x - ay) / (x + ay));
			else
				angle = c2 - c1 * ((x + ay) / (ay - x));
			angle = ((y < 0)?-angle:angle)*57.2957796;
			if(angle > 90)
				angle = angle - 270;
			else
				angle += 90;
			return angle;
		};
	}
}