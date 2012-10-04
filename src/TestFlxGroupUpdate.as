package  
{
	import flash.utils.getTimer;
	import testFlxGroupUpdate.FlxMathstuff;
	import testFlxGroupUpdate.FlxGroupWireframe;
	import testFlxGroupUpdate.FlxGroupKWarp;
	import testFlxGroupUpdate.FlxGroupAdam;
	import org.flixel.*;

	public class TestFlxGroupUpdate extends FlxState
	{
		public function TestFlxGroupUpdate()
		{
			super();
			
			trace("Press 'T' to begin the test.");
			trace("Remember to open the console so you can see the output.")
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("T")) 
			{
				runTest(10, 25, 4);
			}
		}
		
		private var groupAdam:FlxGroupWireframe;
		private var groupKWarp:FlxGroupWireframe;
		
		public function runTest(numParents:uint, numChildren:uint, numGenerations:uint):void
		{
			FlxG.log("----- Creating test objects -----");
			
			groupAdam = createObjects(FlxGroupAdam, FlxMathstuff, numParents, numChildren, numGenerations);
			groupKWarp = createObjects(FlxGroupAdam, FlxMathstuff, numParents, numChildren, numGenerations);
			FlxG.log("Created " + FlxGroupWireframe.totalCount/2 + " FlxGroups each.");
			FlxG.log("Created " + FlxMathstuff.totalCount/2 + " FlxBasic children each.");
						
			FlxG.log("----- Starting performance test -----");
			
			var time:uint;
			
			time = getTimer();
				groupAdam.preUpdate();
				groupAdam.update();
				groupAdam.postUpdate();
			FlxG.log("Adam: " + (getTimer() - time) + " ms.");
			
			time = getTimer();
				groupKWarp.preUpdate();
				groupKWarp.update();
				groupKWarp.postUpdate();
			FlxG.log("KWarp: " + (getTimer() - time) + " ms.");
			
			FlxG.log("----- Test finished -----");
		}
		
		private function createObjects(ParentConstructor:Class, ChildConstructor:Class, numParents:uint, numChildren:uint, numGenerations:uint):FlxGroupWireframe
		{
			var parent:FlxGroupWireframe = new ParentConstructor();
			
			if (numGenerations <= 0)
			{
				for (var c:int = 0; c < numChildren; c++)
					parent.add(new ChildConstructor());
			}
			else
			{
				for (var p:int = 0; p < numParents; p++)
					parent.add(createObjects(ParentConstructor, ChildConstructor, numParents, numChildren, numGenerations-1));
			}
			
			return parent;
		}
	}

}