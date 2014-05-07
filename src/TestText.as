package  
{
	import flixel.ui.FlxText;
	import flash.text.GridFitType;
	import core.FlxTest;
	import flixel.*;
	
	/**
	 * This code tests FlxText and its sometime blurry behavior.
	 */
	public class TestText extends FlxTest
	{
		private var text :TextGridFitted;
		private var text2 :TextGridFitted;
		
		override public function create():void 
		{
			super.create();
			
			var x:Number = FlxG.width * 0.15, y:Number = 30, width: Number = FlxG.width * 0.7;
			
			var textBackground :FlxSprite = new FlxSprite(x, y);
			textBackground.makeGraphic(width, 15, 0x33ff0000);
			add(textBackground);
			
			text = new TextGridFitted(x, y, width, "Single line text: Flixel is a outstanding!");
			text.alignment = "center";
			add(text);
			
			var textBackground2 :FlxSprite = new FlxSprite(int(x), int(y) + 100);
			textBackground2.makeGraphic(width, 90, 0x33ff0000);
			add(textBackground2);
			
			text2 = new TextGridFitted(x, y + 100, width, "Multi-line text: Flixel is a free Actionscript (Flash) library that I distilled from a variety of Flash games that I've worked on over the last couple years, including Gravity Hook, Fathom and Canabalt.\n\nIt's primary function is to provide some useful base classes that you can extend to make your own game objects.");
			text2.alignment = "center";
			add(text2);
			
			add(new FlxText(5, FlxG.height - 30, FlxG.width, "Press C (center), L (left), R (right) or J (justify) to change alignment."));
			add(new FlxText(5, FlxG.height - 20, FlxG.width, "Press N (none), P (pixel), or S (subpixel) to change grid fit type."));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.justPressed("C")) {
				text.alignment = "center";
				text2.alignment = "center";
			}
			
			if (FlxG.keys.justPressed("J")) {
				text.alignment = "justify";
				text2.alignment = "justify";
			}
			
			if (FlxG.keys.justPressed("L")) {
				text.alignment = "left";
				text2.alignment = "left";
			}
			
			if (FlxG.keys.justPressed("R")) {
				text.alignment = "right";
				text2.alignment = "right";
			}
			
			
			// Grid fit type
			
			if (FlxG.keys.justPressed("N")) {
				text.gridFitType = GridFitType.NONE;
				text2.gridFitType = GridFitType.NONE;
			}
			
			if (FlxG.keys.justPressed("P")) {
				text.gridFitType = GridFitType.PIXEL;
				text2.gridFitType = GridFitType.PIXEL;
			}
			
			if (FlxG.keys.justPressed("S")) {
				text.gridFitType = GridFitType.SUBPIXEL;
				text2.gridFitType = GridFitType.SUBPIXEL;
			}
		}
	}
}

import flixel.ui.FlxText;
import flash.text.AntiAliasType;
import flash.text.GridFitType;

class TextGridFitted extends FlxText 
{
	public function TextGridFitted(X:Number, Y:Number, Width:uint, Text:String = null, EmbeddedFont:Boolean = true)
	{
		super(X, Y, Width, Text, EmbeddedFont);
		this.gridFitType = GridFitType.NONE;
	}
	
	public function get gridFitType():String
	{
		return this._textField.gridFitType;
	}
	public function set gridFitType(value:String):void
	{
		if (value == GridFitType.NONE)
		{
			this._textField.antiAliasType = AntiAliasType.NORMAL;
			this._textField.gridFitType = GridFitType.NONE;
		}
		else
		{
			this._textField.antiAliasType = AntiAliasType.ADVANCED;
			this._textField.gridFitType = value;
		}
		
		this._regen = true;
		this.calcFrame();
	}
}