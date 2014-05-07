package testFlxGroupUpdate 
{
	import flixel.FlxBasic;
	
	public class FlxGroupKWarp extends FlxGroupWireframe
	{

		override public function update():void
        {
            var i:uint = 0;
            while(i < length)
            {
                var basic:FlxBasic = members[i++] as FlxBasic;
                if((basic != null) && basic.exists && basic.active)
                {
                    basic.update();
                }
            }
        }
		
		override public function preUpdate():void
        {
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
