package
{
	import flixel.util.FlxRandom;
	import core.FlxTest;

	/**
	 * @author andreas
	 */
	public class TestFlxRandom extends FlxTest
	{
		public function TestFlxRandom()
		{
			super(true);
		}
		
		
		override public function create():void 
		{
			super.create();
			
			var array:Array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
			
			//var rnd:Random = new Random(256);
			var rnd:FlxRandom = new FlxRandom(256);
			
			for (var i:int = 0; i < 15; i++)
			{
				//log(rnd.float());
				//log(rnd.integer(1, 10));
				//log(rnd.boolean());
				//log(rnd.bit(0.8));
				//log('0x' + rnd.color(0).toString(16));
				log(rnd.item(array));
			}
			
			log('------------------------------------------------');
			log(rnd.shuffle(array, false));
		}
	}
}
/*
class Random
{
	public function Random(seed:uint = 0)
	{
		_currentSeed = seed;
	}
	
	// Internal tracker that keeps track of the current value of the seed as it changes with each iteration
	protected var _currentSeed:int = 0;
	
	/**
	 * Constants used in the pseudorandom number generation equation.
	 * These are the constants suggested by the revised MINSTD pseudorandom number generator, and they use the full range of possible integer values.
	 * 
	 * @see 	http://en.wikipedia.org/wiki/Linear_congruential_generator
	 * @see 	Stephen K. Park and Keith W. Miller and Paul K. Stockmeyer (1988). "Technical Correspondence". Communications of the ACM 36 (7): 105–110.
	 * /
	protected const MULTIPLIER:int = 48271;
	protected const MODULUS:int = 2147483647; // 0x7FFFFFFF (31 bit integer)
	
	/**
	 * Internal method to quickly generate a pseudorandom number. Used only by other functions of this class.
	 * Also updates the current seed, which will then be used to generate the next pseudorandom number.
	 * 
	 * @return	A new pseudorandom number between 0 inclusive and 1 exclusive.
	 * /
	protected function generate():int
	{
		return _currentSeed = ((_currentSeed * MULTIPLIER) % MODULUS) & MODULUS;
		//return (_currentSeed / MODULUS);
	}
	
	public function float():Number
	{
		return generate() / MODULUS;
	}
}*/
