package  
{
	import org.flixel.*;

	/**
	 * This code tests FlxGroup::sort().
	 * 
	 * The sort() method has to be able to sort anything, even if that thing does not
	 * have the specified sorting index (e.g. a group made of FlxSprites and FlxGroups being sorted by "y" property).
	 */
	public class TestFlxGroupSort extends FlxState
	{
		public static const MAX_SPRITES :int = 1000;
		public static const MAX_ITERATIONS_TEST :int = 1000;
		
		private var mGroup :FlxGroup;
		
		override public function create():void {
			super.create();	
			
			var i:int;
			var sprites :Array = new Array(1000);
			
			for (i = 0; i < MAX_SPRITES; i++) {
				sprites[i] = new FlxSprite(0, i);	
			}
			
			FlxU.shuffle(sprites, 10);
			
			mGroup = new FlxGroup();
			
			for (i = 0; i < MAX_SPRITES; i++) {
				mGroup.add(sprites[i]);	
			}
			
			var aGroup2 :FlxGroup = new FlxGroup(2);
			aGroup2.add(new FlxSprite(31, 31));
			aGroup2.add(new FlxSprite(42, 42));
			
			mGroup.add(aGroup2); // add an element that does not have the sorting index.
			
			mGroup.remove(sprites[0]); // creates a null entry in the group
			
			if(MAX_SPRITES <= 10) {
				FlxG.log("Before sort:");
				
				for (i = 0; i < mGroup.members.length; i++) {
					FlxG.log(i + " = " + mGroup.members[i] + " " + (mGroup.members[i] ? (mGroup.members[i].hasOwnProperty("y") ? mGroup.members[i].y : '-') : ""));
				}
			}
			
			var time :Number = new Date().getTime();
			
			for (var j :int = 0; j < MAX_ITERATIONS_TEST; j++) {
				mGroup.sort("y", FlxGroup.DESCENDING);	
			}
			
			FlxG.log("Time: " + (new Date().getTime() - time));
			
			if(MAX_SPRITES <= 10) {
				FlxG.log("AFTER sort:");
				
				for (i = 0; i < mGroup.members.length; i++) {
					FlxG.log(i + " = " + mGroup.members[i] + " " + (mGroup.members[i] ? (mGroup.members[i].hasOwnProperty("y") ? mGroup.members[i].y : '-') : ""));
				}
			}
		}
	}
}