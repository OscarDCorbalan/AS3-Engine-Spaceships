package com.hechoal.Biwair 
{
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	/**
	 * ...
	 * @author ...
	 */
	public class ScreenState extends FlxState 
	{
		[Embed(source = "../../../../assets/sprites/buttons/playInactive.png")] private var menubut:Class;
		[Embed(source = "../../../../assets/sprites/buttons/playHover.png")] private var menubuthov:Class;
		protected var btnPlay:FlxButtonPlus;
		protected var title:FlxText;
		
		public function ScreenState(){}
		
		override public function create():void 
		{
			super.create();
			FlxG.flashFramerate = 30;
			FlxG.mouse.show();
			
			btnPlay = new FlxButtonPlus(184, 469, playClick, null, "", 83, 80);
			btnPlay.loadGraphic(new FlxSprite(0, 0, menubut), new FlxSprite(0, 0, menubuthov));
			
			title = new FlxText(52, 17, 125);
			title.antialiasing = false;
			title.size = 20;
			title.shadow = 0xff000000;
			
			add(btnPlay);
			add(title);
		}
		protected function playClick():void{}
	}

}