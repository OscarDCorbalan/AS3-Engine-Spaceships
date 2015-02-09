package com.hechoal.Biwair.engine.Weapons 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class CyanBullet extends Bullet 
	{
		[Embed(source = '../../../../../../assets/sprites/bulletcyan.png')] private var bulletPNG:Class;
		
		protected var xf:int;
		protected var yf:int;
		
		public function CyanBullet() 
		{
			super();
			loadRotatedGraphic(bulletPNG, 16, -1, true, true);
		}
		
		public function fire(bx:int, by:int):void {
			x = bx;
			y = by;
			velocity.y = speed;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
		}
		
	}

}