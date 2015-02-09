package com.hechoal.Biwair.engine.Enemies 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	import com.hechoal.Biwair.Registry;
	import flash.display.Graphics;
	import com.hechoal.Biwair.engine.Weapons.RedBullet;
	
	public class EnemyRed extends Enemy 
	{
		
		protected var firing:Boolean = false;
		public function EnemyRed() 
		{
			super();
			loadGraphic(imgRed, true, false, 23, 19);
			addAnimation("normal", [0, 1, 2, 1], 10, true);
			addAnimation("dead", [3], 0, true);
		}
		
		override public function update():void 
		{
			super.update();
			if (alive && nframe == 0 )
				Registry.bullets.fire(this.getMidpoint().x-7, this.getMidpoint().y-6, angle,_anglerad, Class(RedBullet));
			nframe = (nframe+1)%96;
			
		}
		override public function start(xx:int = 0, yy:int = 0, vx:int = 0, vy:int = 0, mu:int = 0):void {
			super.start(xx, yy, vx, vy, mu);
			nframe = Math.random() * 127;
		}

		
	}

}