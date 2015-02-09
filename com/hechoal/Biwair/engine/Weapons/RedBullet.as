package com.hechoal.Biwair.engine.Weapons 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class RedBullet extends Bullet 
	{
		[Embed(source = '../../../../../../assets/sprites/bulletred.png')] private var bulletPNG:Class;
		public function RedBullet() 
		{
			super();
			//loadRotatedGraphic(bulletPNG,32,-1,true,false);
			loadGraphic(bulletPNG, true, false, 14, 12, false);
			addAnimation("normal", [0, 1, 2, 3], 10, true);
			play("normal")
		}
	}

}