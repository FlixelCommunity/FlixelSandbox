package testFlxGroupUpdate 
{
	import flixel.FlxBasic;
	
	public class FlxGroupEfficient extends FlxGroupWireframe
	{
		
		// This class should be right in between the other two in terms of
		// performance, since an "if" check for a Boolean is REALLY cheap,
		// cheaper than creating and going through a loop.
		
		
		// This should actually be set in the constructor. 
		// We will assume "true" to get the best of both worlds
		private var efficient:Boolean = true;

		override public function update():void
        {
            var i:uint = 0;
            while(i < length)
            {
                var basic:FlxBasic = members[i++] as FlxBasic;
                if((basic != null) && basic.exists && basic.active)
                {
					if (efficient)
					{
						basic.preUpdate();
						basic.update();
						basic.postUpdate();
					}
					else
					{
						basic.update();
					}
                }
            }
        }
		
		override public function preUpdate():void
        {
			if (efficient) return;
			
            var i:uint = 0;
            while(i < length)
            {
                var basic:FlxBasic = members[i++] as FlxBasic;
                if((basic != null) && basic.exists && basic.active)
                {
                    basic.preUpdate();
                }
            }
        }
		
		override public function postUpdate():void
        {
			if (efficient) return;
			
            var i:uint = 0;
            while(i < length)
            {
                var basic:FlxBasic = members[i++] as FlxBasic;
                if((basic != null) && basic.exists && basic.active)
                {
                    basic.postUpdate();
                }
            }
        }
		
	}
}
