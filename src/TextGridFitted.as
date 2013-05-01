package 
{
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import org.flixel.FlxText;

	/**
	 * @author andreas
	 */
	public class TextGridFitted extends FlxText 
	{
		public function TextGridFitted(X : Number, Y : Number, Width : uint, Text : String = null, EmbeddedFont : Boolean = true) {
			super(X, Y, Width, Text, EmbeddedFont);
			
			this._textField.antiAliasType = AntiAliasType.ADVANCED;
			this._textField.sharpness = -200;
			this._textField.gridFitType = GridFitType.SUBPIXEL;
		}
	}
}
