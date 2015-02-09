package com.hechoal.Biwair.engine 
{
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class ExplosionManager extends FlxGroup 
	{
		
		protected var expPlayer:ExplosionPlayer = new ExplosionPlayer();
		
		public function ExplosionManager() 
		{
			super();
			
			for (var i:int = 0; i < 100; i++)
			{
				add(new ExplosionEnemy);
			}
			add(expPlayer);
		}
		
		public function fire(bx:int, by:int):void
		{
			
			if (getFirstAvailable())
			{
				Explosion(getFirstAvailable()).fire(bx, by);
			}
			
		}
		
		public function firePlayer(bx:int, by:int):void 
		{
			expPlayer.fire(bx, by);
		}
		
	}

}