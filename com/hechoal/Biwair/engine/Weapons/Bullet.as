package com.hechoal.Biwair.engine.Weapons 
{
	import com.hechoal.Biwair.engine.Shield;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxCollision;
	
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Bullet extends FlxSprite 
	{
		protected const bottom:uint = 620;
		protected const right:uint = 520;
		public function Bullet() 
		{
			exists = false;
		}
		override public function update():void 
		{
			super.update();
			if (exists && ( y < -70 || x < -70 || y > bottom || x > right))
			{
				exists = false;
			}
		}
		
		public function shieldCheck(exp:Shield):void {
			if(FlxCollision.pixelPerfectCheck(this, exp, 200))
			{
				exists = false;
			}
		}
		public var speed:int = 150;
		public function fire(bx:int, by:int,phi:Number,mu:Number):void {
			//angle = phi;			
			x = bx;
			y = by;		
			velocity.x = -speed * Math.sin(mu);
			velocity.y = speed * Math.cos(mu);			
			angle = phi;
			exists = true;
		}
	}

}