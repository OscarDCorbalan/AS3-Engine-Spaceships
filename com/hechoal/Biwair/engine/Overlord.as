package com.hechoal.Biwair.engine 
{
	import adobe.utils.CustomActions;
	import com.hechoal.Biwair.engine.Enemies.*
	import com.hechoal.Biwair.engine.Weapons.Shooter;
	import flash.sampler.NewObjectSample;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Overlord extends FlxGroup
	{
		private var countframes:uint;
		public function Overlord():void 
		{
			super();	
			var i:uint;
		
		}

		
		protected var vx:Number, vy:Number, mu:Number, pos:Number, dice:uint;
		protected var 	_center:FlxPoint = new FlxPoint(), 
						_startpos:FlxPoint = new FlxPoint(),
						_dif:FlxPoint = new FlxPoint();
		protected var _enemy:Enemy;
		
		
		
		public function fireShip(getSomeClass:Function,cs:Class = null, xx:int = 0, yy:int = 0, ff:int=0):void {
			//green.fire();
			dice = Math.floor(Math.random()*6);
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
			mu = FlxU.getAngle(_center, _startpos);			
			createShip(getSomeClass());
			_dif.x = _startpos.x;
			_dif.y = _startpos.y;
			if (dice == 1 || dice > 2) {
				_startpos.x = _dif.x - 30 * Math.cos((mu +30) * _torad);
				_startpos.y = _dif.y - 30 * Math.sin((mu +30) * _torad);
				createShip(getSomeClass());
			}
			if (dice >= 5) {
				_startpos.x = _dif.x - 60 * Math.cos((mu +30) * _torad);
				_startpos.y = _dif.y - 60 * Math.sin((mu +30) * _torad);
				createShip(getSomeClass());
			}
			if (dice >= 2) {
				_startpos.x = _dif.x + 30 * Math.cos((mu -30) * _torad);
				_startpos.y = _dif.y + 30 * Math.sin((mu -30) * _torad);
				createShip(getSomeClass());
			}
			if (dice == 4 || dice == 6) {
				_startpos.x = _dif.x + 60 * Math.cos((mu -30) * _torad);
				_startpos.y = _dif.y + 60 * Math.sin((mu -30) * _torad);
				createShip(getSomeClass());
			}
		}	
		
		
		
		/*protected var _diceclass:Number;
		private function getSomeClass():Class {
			_diceclass = Math.floor( Math.random() * 10);
			switch(_diceclass) {			
				case 0: return EnemyYellow;
				case 1: return EnemyRed;
				default: return EnemyGreen;
			}
		}*/
		protected static var _alpha:Number = 1.75;
		protected static var _torad:Number = Math.PI / 180;
		private function createShip(cs:Class):void {
			if (getFirstAvailable(cs)){}
			else {
				add(new cs);				
			}
			_enemy = cs(getFirstAvailable(cs));
			_enemy.start(_startpos.x, _startpos.y, vx, vy, mu);
		}
	}

}