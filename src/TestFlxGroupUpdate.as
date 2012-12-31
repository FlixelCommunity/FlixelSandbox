package  
{
	import core.FlxTest;
	import flash.utils.getTimer;
	import testFlxGroupUpdate.FlxMathstuff;
	import testFlxGroupUpdate.FlxGroupWireframe;
	import testFlxGroupUpdate.FlxGroupKWarp;
	import testFlxGroupUpdate.FlxGroupAdam;
	import org.flixel.*;

	public class TestFlxGroupUpdate extends FlxTest
	{
		public function TestFlxGroupUpdate()
		{
			super(true);
		}
		
		
		override public function create():void 
		{
			super.create();
			
			this.add(new FlxText(40, 40, FlxG.width - 80, "Press 'T' to begin the test."));
			this.add(new FlxText(40, 80, FlxG.width - 80, "Remember to open the console so you can see the output."));
						
			log("Press 'T' to begin the test.");
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
			log("----- Creating test objects -----");
			
			groupAdam = createObjects(FlxGroupAdam, FlxMathstuff, numParents, numChildren, numGenerations);
			groupKWarp = createObjects(FlxGroupKWarp, FlxMathstuff, numParents, numChildren, numGenerations);
			log("Created", FlxGroupWireframe.totalCount/2, "FlxGroups each.");
			log("Created", FlxMathstuff.totalCount/2, "FlxBasic children each.");
						
			log("----- Starting performance test -----");
			
			var time:uint;
			
			time = getTimer();
				groupAdam.preUpdate();
				groupAdam.update();
				groupAdam.postUpdate();
			log("Adam:", (getTimer() - time), "ms.");
			
			time = getTimer();
				groupKWarp.preUpdate();
				groupKWarp.update();
				groupKWarp.postUpdate();
			log("KWarp:", (getTimer() - time), "ms.");
			
			log("----- Test finished -----");
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
