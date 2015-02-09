package com.hechoal.Biwair.engine 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class ExplosionPlayer extends Explosion
	{
		[Embed(source = "../../../../../assets/sprites/explosionPlayer.png")] private var img:Class;

		public function ExplosionPlayer() 
		{
			super();
			_dx = 29;
			_dy = 29;
			loadGraphic(img, true, false, 78,78,true);
			//addAnimation("normal", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 22, 20, 18, 16, 14, 12, 10, 8, 6, 4, 2], 60, false);
		}


	}

}