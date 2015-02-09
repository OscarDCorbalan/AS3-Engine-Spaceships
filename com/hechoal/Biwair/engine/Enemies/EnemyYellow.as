package com.hechoal.Biwair.engine.Enemies 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	import com.hechoal.Biwair.Registry;
	import com.hechoal.Biwair.engine.Weapons.YellowBullet;
	public class EnemyYellow extends Enemy 
	{
		
		public function EnemyYellow() 
		{
			super();
			loadGraphic(imgYellow, true, false, 24, 23,true);
			addAnimation("normal", [0, 1, 2, 1], 8, true);
			addAnimation("dead", [3],0 , true);
		}
		
		override public function update():void 
		{
			super.update();			
			if (alive && nframe == 0){// || nframe == 20 || nframe == 40) {
				weapon();
			}
			nframe = (nframe+1)%128;
		}
		
		protected const _quart:Number = Math.PI / 4;
		private function weapon():void {
			//Registry.bullets.fireYL(x+8, y+19);
			//Registry.bullets.fireYR(x + 17, y + 19);
			
			Registry.bullets.fire(getMidpoint().x-12, getMidpoint().y -12, angle-45, _anglerad-_quart, Class(YellowBullet));
			Registry.bullets.fire(getMidpoint().x-12, getMidpoint().y -12, angle+45, _anglerad+_quart, Class(YellowBullet));
		}
	}

}