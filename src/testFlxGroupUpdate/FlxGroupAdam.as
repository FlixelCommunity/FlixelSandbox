package testFlxGroupUpdate 
{
	import org.flixel.FlxBasic;
	
	public class FlxGroupAdam extends FlxGroupWireframe
	{
		
		override public function preUpdate():void
		{
		}
		
		override public function update():void
		{
			var i:uint = 0;
			while(i < length)
			{
				var basic:FlxBasic = members[i++] as FlxBasic;
				if((basic != null) && basic.exists && basic.active)
				{
					basic.preUpdate();
					basic.update();
					basic.postUpdate();
				}
			}
		}
		
	}
}
