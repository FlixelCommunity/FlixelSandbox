package  
{
	import core.FlxTest;
	import org.flixel.*;
	import testFlxSpriteAlpha.*;

	public class TestFlxSpriteAlpha extends FlxTest
	{
		// By Amon (www.amon.co) - http://opengameart.org/content/animated-robot
		[Embed(source="../assets/daxbotsheet_0.png")] private var daxbotsheet_0_png:Class;
		
		private var mSpriteTest :SpriteTest;
		private var mSpriteTestBug :SpriteTest;
		private var mAnimatedSprite :FlxSprite;
		
		override public function create():void 
		{
			FlxG.log("Super");

			super.create();	
			
			FlxG.log("Duper");
			
			FlxG.log("Alrite Sprite:");	
			
			mSpriteTest = new SpriteTest(50, 100, false);
			add(mSpriteTest);
			
			FlxG.log("Bugged Sprite:");			
			
			// Woot! This sprite is trying to set the frame number to `1`,
			//  which produces a warning as expected. :)
			mSpriteTestBug = new SpriteTest(180, 100, true);
			add(mSpriteTestBug);
			
			FlxG.log("Before creating the animated sprite");
			
			mAnimatedSprite = new FlxSprite(310, 90);
			mAnimatedSprite.loadGraphic(daxbotsheet_0_png, true, false, 64, 68);
			mAnimatedSprite.addAnimation("walk", [0, 1, 2, 3], 5);
			mAnimatedSprite.play("walk");
			add(mAnimatedSprite);
			
			FlxG.log(mAnimatedSprite.numFrames + '/' + mAnimatedSprite.maxFrames);

			add(new FlxText(50, 155, 50, mSpriteTest.name));
			add(new FlxText(180, 155, 50, mSpriteTestBug.name));
			add(new FlxText(310, 155, 50, "Animated sprite"));
			
			var t:FlxText = new FlxText(50, 200, 300, "Both red squares should fade out at the same pace,\nbut the buggy one is way faster.\n\nPress ENTER to begin the fading or to reset the test.\nControl de animated sprite:\n F = first frame, L = last frame, O = out of bound frame, P = play");
			t.alignment = "center";
			add(t);
			
			this.registerKey("ENTER", beginTest);
		}
		
		private var testRunning:Boolean = false;
		private function beginTest():void
		{
			if (testRunning)
			{
				testRunning = false;
				mSpriteTest.resetTest();
				mSpriteTestBug.resetTest();
				log("------------------------------------");
			}
			else
			{
				testRunning = true;
				mSpriteTest.enabled = true;
				mSpriteTestBug.enabled = true;
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("F"))
			{
				FlxG.log("mAnimatedSprite.frame = 0 (first)");
				mAnimatedSprite.frame = 0;
			}
			
			if (FlxG.keys.justPressed("L"))
			{
				FlxG.log("mAnimatedSprite.frame = 15 (last)");
				mAnimatedSprite.frame = 15;
			}
		
			if (FlxG.keys.justPressed("O"))
			{
				FlxG.log("mAnimatedSprite.frame = 20 (out of bound)");
				mAnimatedSprite.frame = 20;
			}
			
			if (FlxG.keys.justPressed("P"))
			{
				FlxG.log("mAnimatedSprite.play(walk)");
				mAnimatedSprite.play("walk");
			}
		}
	}

}