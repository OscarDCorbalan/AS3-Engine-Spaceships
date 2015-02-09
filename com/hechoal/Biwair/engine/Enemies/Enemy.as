package com.hechoal.Biwair.engine.Enemies 
{
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import com.hechoal.Biwair.Registry;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import com.hechoal.Biwair.engine.Explosion;
	import com.hechoal.Biwair.Registry;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Enemy extends FlxSprite
	{
		
		[Embed(source = "../../../../../../assets/sprites/green.png")] protected var imgGreen:Class;		
		[Embed(source = "../../../../../../assets/sprites/yellow.png")] protected var imgYellow:Class;
		[Embed(source = "../../../../../../assets/sprites/red.png")] protected var imgRed:Class;
		[Embed(source = "../../../../../../assets/sprites/magenta.png")] protected var imgMagenta:Class;
		[Embed(source = "../../../../../../assets/sprites/blue.png")] protected var imgBlue:Class;
		[Embed(source = "../../../../../../assets/sprites/spreader.png")] protected var imgSpreader:Class;
		[Embed(source = '../../../../../../assets/sounds/explosion1.mp3')] private var explosion1:Class;
		[Embed(source = '../../../../../../assets/sounds/explosion2.mp3')] private var explosion2:Class;
		[Embed(source = '../../../../../../assets/sounds/explosion3.mp3')] private var explosion3:Class;
		[Embed(source = '../../../../../../assets/sounds/explosion4.mp3')] private var explosion4:Class;

		protected var rand:Number;
		protected const bottom:uint = 650;
		protected const right:uint = 550;
		protected var nframe:uint = 0;
		protected var mov:Number,
					_anglerad:Number;	
		protected var _deadframes:uint;
		protected var _points:FlxText = new FlxText(0, 0, 50);
		
		public function Enemy():void 
		{
			super();
			//loadGraphic(imgGreen, true, true, 24, 23);		
			health = 1;				
			exists = false;	
		}
		
		public function start(xx:int = 0, yy:int = 0, vx:int = 0, vy:int = 0, mu:int = 0):void {
			x = xx;
			y = yy;
			velocity.x = vx * Registry.speedFactor + (Registry.speedFactor - 1)*10;
			velocity.y = vy * Registry.speedFactor;
			angle = mu;
			_anglerad = mu * Math.PI / 180;
			exists = true;
			alive = true;
			play("normal");			
		}
		
		public function explode():void {
			//exists = false;
			alive = false;
			Registry.expManager.fire(x, y);
			_deadframes = 0;
			_points.x = x;
			_points.y = y;
			_points.text = "" + Registry.ui.addChain();
			Registry.ui.add(_points);
			play("dead");
			rand = Math.random();
			FlxG.play(explosion1);			
		}
		
		
		override public function update():void 
		{
			super.update();
			if (exists && ( y < -100 || x < -100 || y > bottom || x > right))
			{
				exists = false;
			}
			else if(!alive){
				_deadframes++;
				if (_deadframes == 90) {
					Registry.ui.remove(_points);
					exists = false;
				}
			}
		}
		
		public function explosionCheck(exp:Explosion):void {
			if(alive && FlxCollision.pixelPerfectCheck(this, exp,127))
			{
				FlxG.shake(0.01,0.5);
				explode();
			}
		}
	}

}