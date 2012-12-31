package core 
{
	import org.flixel.FlxU;
	import org.flixel.FlxSave;
	import org.flixel.FlxG;
	import org.flixel.FlxState;

	public class FlxTest extends FlxState 
	{
		
		// I had it at 3, but I prefer 1
		private static const numRecentTests:uint = 1;
		
		private static var save:FlxSave = new FlxSave();
		private static var recentTests:Array = getRecentTests();
		private static var registeredTests:Vector.<Class> = new Vector.<Class>();
		
		public static function register(testClass:Class):void
		{
			if (registeredTests.indexOf(testClass) == -1)
				registeredTests.push(testClass);
		}
		
		public static function retrieve(sort:Boolean = true):Vector.<Class>
		{
			// Create a copy to avoid keeping references to the private var `registeredTests`
			var tests:Vector.<Class> = registeredTests.concat();
			
			if (sort)
			{
				recentTests ||= getRecentTests();
				tests.sort(sortTests);
			}
			
			return tests;
		}
		
		public static function isRecent(testClass:Class):Boolean
		{
			recentTests ||= getRecentTests();
			var testName:String = FlxU.getClassName(testClass);
			var testIndex:int = recentTests.indexOf(testName);
			return (testIndex >= 0);
		}
		
		// Move the most recently used tests to the top of the list
		private static function sortTests(test1:Class, test2:Class):int
		{
			var test1Index:int = recentTests.indexOf(FlxU.getClassName(test1));
			var test2Index:int = recentTests.indexOf(FlxU.getClassName(test2));
			
			if (test1Index > test2Index) { return -1; }
			else if (test1Index < test2Index) { return +1; }
			else
			{
				// If not found in the list, sort alphabetically
				return ( FlxU.getClassName(test1).toLocaleLowerCase() < FlxU.getClassName(test2).toLocaleLowerCase() ) ? -1 : 1;
			}
		}
		
		private static function getRecentTests():Array
		{
			save.bind("FlxTest");
			return save.data["recentTests"] || [];
		}
		
		public static function start(Test:Class):void
		{
			// Store the test as recently used
			recentTests ||= getRecentTests();
			var testName:String = FlxU.getClassName(Test);
			var testIndex:uint = recentTests.indexOf(testName);
			if (testIndex >= 0) { recentTests.splice(testIndex, 1); }
			recentTests.push(testName);
			
			// Only store the last `numRecentTests` used tests
			while(recentTests.length > numRecentTests)
				{ recentTests.shift(); }
			
			// This line may be unecessary, I'm not sure if FlxState handles references or clones the data	
			save.data["recentTests"] = recentTests;
			save.flush();
						
			// Start the test
			FlxG.switchState(new Test());
		}
		
		
		
		public var name:String;
		
		public function FlxTest(useTerminal:Boolean = false) 
		{
			super();
			
			// This isn't working. How do I display the terminal?
			if (useTerminal) { FlxG.setDebuggerLayout(FlxG.DEBUGGER_STANDARD); }
			
			this.name = FlxU.getClassName(this);
			this.registerKey("ESCAPE", returnToMenu);
			
			log("-------------------------------------------");
			log("\t", "Starting test", this.name);
			log("\t", "Press ESC to rturn to the menu.");
			log("-------------------------------------------");
		}
		
		protected function log(... args):void
		{
			var str:String = args.join(" ");
			trace(str);
			FlxG.log(str);
		}
		
		private var keyMap:Object = {};
		// Registering a second key over the existing one will replace it
		protected function registerKey(key:String, callback:Function, ... parameters):void
		{
			if (callback != null)
			{
				parameters.unshift(callback);
				keyMap[key] = generateCallback.apply(null, parameters); // So ugly...
			}
			else
			{
				delete keyMap[key];
			}
		}
		protected function unregisterKey(key:String):void
		{
			this.registerKey(key, null);
		}

		override public function update():void
		{
			super.update();
			
			for (var key:String in keyMap)
			{
				if (FlxG.keys.justPressed(key))
				{
					//Function(keyMap[key]).call();
					keyMap[key].call();
				}
			}
		}
		
		protected function returnToMenu():void
		{
			FlxG.switchState(new SelectTestMenu());
		}

	}
}