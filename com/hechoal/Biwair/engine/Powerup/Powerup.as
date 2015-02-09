package com.hechoal.Biwair.engine.Powerup 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import com.hechoal.Biwair.Registry;
	/**
	 * ...
	 * @author ...
	 */
	public class Powerup extends FlxSprite 
	{
		protected var _points:FlxText = new FlxText(0, 0, 50);
		protected var _deadframes:uint;
		
		public function Powerup(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);	
			exists = false;			
			_points.text = "Factor!!";
		}
		
		public function start(xx:int = 0, yy:int = 0, vx:int = 0, vy:int = 0):void {
			x = xx;
			y = yy;
			velocity.x = vx;
			velocity.y = vy;
			alive = true;
			exists = true;
			_deadframes = 0;
		}
		override public function update():void 
		{
			super.update();
			if (!alive) {
				_deadframes ++;
				if (_deadframes == 60) {
					_deadframes = 0;
					Registry.ui.remove(_points);
					exists = false;					
				}
			}
		}
		public function getMe():void {
			alive = false;
			_points.x = x-10;
			_points.y = y+5;
			Registry.ui.add(_points);
			_deadframes = 0;
			play("dead");
			velocity.x = 0;
			velocity.y = 0;
		}
	}

}