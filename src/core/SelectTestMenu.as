package core 
{
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxButton;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;

	public class SelectTestMenu extends FlxState 
	{
		public function SelectTestMenu() 
		{
			super();
		}

		protected var buttons:FlxGroup;
		override public function create():void
		{
			super.create();
			
			// TODO: Hide console if visible
			FlxG.mouse.show();
			
			buttons = new FlxGroup();
			this.add(buttons);
			
			// I don't feel like hardcoding these things
			var sampleButton:FlxButton = new FlxButton(0, 0, "Lorem Ipsum");
			const buttonWidth:Number = sampleButton.width;
			const buttonHeight:Number = sampleButton.height;
			const buttonPaddingY:Number = 3;
			const buttonPaddingTop:Number = 30;
			
			const buttonX:Number = (FlxG.width / 2) - (buttonWidth / 2);
			
			var tests:Vector.<Class> = FlxTest.retrieve(true);
			for (var i:int = 0; i < tests.length; i++)
			{
				var testClass:Class = tests[i];
				var testName:String = FlxU.getClassName(testClass);
				var buttonY:Number = buttonPaddingTop + (buttonHeight + buttonPaddingY) * i;
				var buttonCallback:Function = generateCallback(FlxTest.start, testClass);

				// TODO: Make the button image larger
				var button:FlxButton = new FlxButton(buttonX, buttonY, testName, buttonCallback);
				if (!FlxTest.isRecent(testClass)) { button.alpha = 0.70; }
				button.width = buttonWidth;
				buttons.add(button);
			}
		}

	}
}
