package com.hechoal.Biwair.engine 
{
	import com.hechoal.Biwair.engine.Weapons.YellowBullet;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class BulletManager extends FlxGroup 
	{
		
		public function BulletManager() 
		{
			super();
		}
		/*
		public function fireYL(bx:int, by:int):void {
			if (getFirstAvailable(YellowBullet))
			{
				YellowBullet(getFirstAvailable(YellowBullet)).fireL(bx, by);	
				//trace("yellow bullet reused L");
			}
			else {
				add(new YellowBullet);
				YellowBullet(getFirstAvailable(YellowBullet)).fireL(bx, by);
				//trace("yellow bullet created L");
			}
		}
		public function fireYR(bx:int, by:int):void {
			if (getFirstAvailable(YellowBullet))
			{
				YellowBullet(getFirstAvailable(YellowBullet)).fireR(bx, by);	
				//trace("yellow bullet reused R");
			}
			else {
				add(new YellowBullet);
				YellowBullet(getFirstAvailable(YellowBullet)).fireR(bx, by);
				//trace("yellow bullet created R");
			}
		}*/
		public function fire(bx:int, by:int, phi:Number,mu:Number, cs:Class):void
		{
			if (getFirstAvailable(cs))
			{
				cs(getFirstAvailable(cs)).fire(bx, by,phi,mu);	
				//trace(cs + " reused");
			}
			else {
				add(new cs);
				cs(getFirstAvailable(cs)).fire(bx, by,phi,mu);
				//trace(cs + " created");
			}
			
		}
		
		
		
	}

}