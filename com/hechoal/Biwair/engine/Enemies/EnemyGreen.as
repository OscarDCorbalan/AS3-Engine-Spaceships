package com.hechoal.Biwair.engine.Enemies 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class EnemyGreen extends Enemy 
	{
		
		public function EnemyGreen() 
		{
			super();
			loadGraphic(imgGreen, true, false, 24,23);	
			addAnimation("normal", [0, 1, 2, 1], 10, true);
			addAnimation("dead", [3], 0, true);
		}
	}

}