package com.hechoal.Biwair.engine.Enemies 
{
	/**
	 * ...
	 * @author Oscar D. Corbalan
	 */
	public class EnemySpreader extends Enemy 
	{
		
		public function EnemySpreader() 
		{
			super();
			loadGraphic(imgSpreader, true, false, 49,49);	
			addAnimation("normal", [3, 2, 1, 0], 20, true);
			addAnimation("dead", [4], 0, true);
		}
		
	}

}