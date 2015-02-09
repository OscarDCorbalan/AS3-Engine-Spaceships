package com.hechoal.Biwair.engine.Weapons 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class YellowBullet extends Bullet 
	{
		[Embed(source = '../../../../../../assets/sprites/bulletyellow.png')] private var bulletPNG:Class;

		public function YellowBullet() 
		{
			super();
			//loadRotatedGraphic(bulletPNG, 8, -1, true, true);
			loadGraphic(bulletPNG, false, false, 21, 21, false);
		}
	}
}