package testFlxGroupUpdate 
{
	import flixel.FlxBasic;

	public class FlxMathstuff extends FlxBasic 
	{
		public static var totalCount:uint = 0;
		
		public function FlxMathstuff() 
		{
			totalCount++;
		}

		protected var a:Number;
		protected var b:Number;
		
		protected var add:Number;
		protected var sub:Number;
		protected var mult:Number;
		protected var div:Number;
		
		
		protected static var totalAdd:Number;
		protected static var totalSub:Number;
		protected static var totalMult:Number;
		protected static var totalDiv:Number;
		

		override public function preUpdate():void 
		{
			super.preUpdate();
			
			a = Math.random();
			b = Math.random();
		}
			
		override public function update():void 
		{
			super.update();
			
			add = a + b;
			sub = a - b;
			mult = a * b;
			div = a / b;
		}
			
		override public function postUpdate():void 
		{
			super.postUpdate();
			
			totalAdd += add;
			totalSub += sub;
			totalMult += mult;
			totalDiv += div;
		}

	}
}
