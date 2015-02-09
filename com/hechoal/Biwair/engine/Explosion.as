package com.hechoal.Biwair.engine 
{
	import com.hechoal.Biwair.engine.Weapons.Shooter;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import com.hechoal.Biwair.Registry;
	import com.hechoal.Biwair.engine.Enemies.Enemy;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Explosion extends FlxSprite
	{
		protected var _dx:Number;
		protected var _dy:Number;
		public var radius:int;
		
		protected static var anim:Vector.<uint> = new <uint>
			[1, 3, 5, 7, 9, 10, 11, 12, 13, 14,
			15, 16, 17, 18, 19, 20, 21, 22, 
			23, 23, 24, 24, 24];
		protected var explodingFrame:uint;
		public function Explosion() 
		{			
			explodingFrame = 0;
			exists = false;
		}
		
		public function fire(bx:int, by:int):void
		{
			x = bx - _dx;
			y = by - _dy;
			explodingFrame = 0;
			alpha = 1;
			exists = true;
		}
		
		protected const _s:uint = 23;
		protected var _scale:Number;
		protected var i:uint;
		protected var _mem:Array;
		protected var _en:Enemy;
		override public function update():void 
		{
			super.update();
			explodingFrame++;
			
			//trace(this._curFrame);
			if (explodingFrame < _s)
				frame = anim[explodingFrame];				
			else if (alpha > 0.05){//explodingFrame < 131){
				alpha -= 0.01;
			}
			else {
				exists = false;
			}

			if (alpha > 0.5) 
				for (i = 0; i < Registry.overlord.length; i++)			
				{
					if (Registry.overlord.members[i] != null && Registry.overlord.members[i].exists
						&& !(Registry.overlord.members[i] is Shooter))
						Registry.overlord.members[i].explosionCheck(this);
					
				}
			
		}
	}

}