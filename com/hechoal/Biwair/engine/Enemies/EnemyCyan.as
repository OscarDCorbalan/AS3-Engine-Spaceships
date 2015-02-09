package com.hechoal.Biwair.engine.Enemies 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class EnemyCyan extends Enemy 
	{
		
		[Embed(source = "../../../../../../assets/sprites/cyan.png")] protected var imgCyan:Class;
		
		public function EnemyCyan() 
		{
			super();
			loadGraphic(imgCyan, false, true, 37, 23);	
		}
		
		override public function update():void 
		{
			super.update();
			if (nframe == 0) 
				Registry.bullets.fire(x+5, y,Class(CyanBullet));
			else if (nframe == 128) 
				Registry.bullets.fire(x+20, y,Class(CyanBullet));
			nframe = (nframe+1)%256;
			
		}
		
	}

}