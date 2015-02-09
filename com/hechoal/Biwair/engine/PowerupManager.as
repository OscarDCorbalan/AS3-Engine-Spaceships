package com.hechoal.Biwair.engine 
{
	import com.hechoal.Biwair.engine.Powerup.Powerup;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import com.hechoal.Biwair.engine.Powerup.*;
	import com.hechoal.Biwair.Registry;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author ...
	 */
	public class PowerupManager extends FlxGroup 
	{
		protected var _pu:Powerup;
		
		public function PowerupManager() 
		{
			super();
		}
		
		protected var vx:Number, vy:Number, pos:Number, dice:uint;
		protected var 	_center:FlxPoint = new FlxPoint(), 
						_startpos:FlxPoint = new FlxPoint();
						
		/*public function fireFactor():void {
			pos = Math.random() * 2000;
			_center.x = 50 + 350 * Math.random();
			_center.y = 50 + 450 * Math.random();			
			if (pos < 450) {
				_startpos.x = pos;
				_startpos.y = -25;				
			}
			else if ( pos < 1000) {
				_startpos.x = 475;
				_startpos.y = pos - 450;
			}
			else if ( pos < 1450) {
				_startpos.x = pos - 1000;
				_startpos.y = 575;
			}
			else {
				_startpos.x = -25;
				_startpos.y = pos - 1450;
			}
			vx = (_center.x - _startpos.x -11) * 0.1;
			vy = (_center.y - _startpos.y -11) * 0.1;
			createShip(PUFactor);
		}*/
		
		private function createShip(cs:Class):void {
			if (getFirstAvailable(cs)){}
			else {
				add(new cs);				
			}
			_pu = cs(getFirstAvailable(cs));
			trace(cs,_pu);
			_pu.start(_startpos.x, _startpos.y, vx, vy);
			
		}
		
	}

}