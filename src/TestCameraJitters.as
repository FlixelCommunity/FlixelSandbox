package  
{
	import flixel.tile.FlxTilemap;
	import core.FlxTest;
	import flixel.*;
	import cameraJitters.Player;
	
	/**
	 * This is a test case based on Dirk Bunk's code: https://github.com/krix/CameraScrollFix 
	 */
	public class TestCameraJitters extends FlxTest
	{
		[Embed(source = '../assets/jitters/tiles.png')] private var MapTiles:Class;
        [Embed(source = '../assets/jitters/map.csv', mimeType = "application/octet-stream")] private var MapData:Class;
		
		private var _map:FlxTilemap;
		private var _player:Player;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff336699;
			
			_map = new FlxTilemap();
            _map.loadMap(new MapData(), MapTiles);
			FlxG.camera.setBounds(0, 0, _map.width, _map.height, true);
			add(_map);
			
			_player = new Player(50, 50);
			FlxG.camera.follow(_player, FlxCamera.STYLE_LOCKON);
			add(_player)
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(_map, _player);
		}
		
	}

}