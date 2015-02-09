package com.hechoal.Biwair.engine.Enemies 
{
	import com.hechoal.Biwair.engine.Weapons.Shooter;
	import com.hechoal.Biwair.Registry;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class EnemyMagenta extends Enemy 
	{
		protected var shooter:Shooter;
		
		public function EnemyMagenta() 
		{
			super();			
			loadGraphic(imgMagenta, true, false, 22, 22);
			addAnimation("normal", [0, 1, 2, 3, 2, 1], 10, true);
			addAnimation("dead", [4], 0, true);
		}
		
		override public function start(xx:int = 0, yy:int = 0, vx:int = 0, vy:int = 0, mu:int = 0):void 
		{
			super.start(xx, yy, vx, vy, mu);
			if(shooter == null) shooter = new Shooter(this);
			shooter.start();
		}
		
		override public function explode():void 
		{
			shooter.stop();
			super.explode();
			
		}
	}

}