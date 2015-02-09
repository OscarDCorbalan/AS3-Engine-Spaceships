package com.hechoal.Biwair.engine 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FX.BlurFX;
	import org.flixel.system.input.Mouse;
	import com.hechoal.Biwair.Registry;
	import org.flixel.plugin.photonstorm.FlxControl;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../../../../../assets/sprites/asteroid.png")] private var img:Class;
		
		
		protected var move_speed:Number = 2;		
		protected var puShield:Boolean = false;		
		protected var respawning:Boolean = false;
		protected var exploding:Boolean = false;
		protected var explodingFrame:uint = 0;
		protected var shieldFrame:uint;
		
		//protected var emitter:FlxEmitter;
		protected var particles:FlxParticle;
		
		protected var blur:BlurFX;
		
		public function Player(X:Number = 210, Y:Number=260):void
		{
			super(X, Y);
			loadGraphic(img, true, false, 22, 22, true);
			
			health = 1;
			
			addAnimation("alive", [0]);
			addAnimation("dead", [1]);
			addAnimation("respawning", [2]);
			//facing = FlxSprite.LEFT;
		}
		
		
		override public function update():void
		{
			super.update();
			//play("normal");

			if (shieldFrame > 0) {
				Registry.ui.setRespawnCounter(shieldFrame / 18);
				shieldFrame--;				
			}
			
			if (alive) {
				movement();				
			}			
			else if(exploding){
				explodingFrame++;				
				if (explodingFrame < 60) 
					{}//return;
				else{
					respawn();
					puActivateShield();
				}
			}
			else if (respawning ) {
				movement();	
				if (shieldFrame > 0) {}
				else {
					respawnFinish();
				}
			}
			
			//if(!emitter.) emitter.recycle(FlxEmitter);
			//emitter.emitParticle();
		}
		
		public function respawn():void {
			play("respawning");
			respawning = true;
			exploding = false;
			x = 210;
			y = 260;	
		}
		private function puActivateShield():void {			
			shieldFrame = 162;
			Registry.ui.startRespawnCounter(shieldFrame);
		}
		
		private function respawnFinish():void {
			play("alive");
			respawning = false;
			alive = true;
			Registry.ui.stopRespawnCounter();
			puShield = false;
		}
		public function isHitable():Boolean {
			if (exploding) return false;
			if (respawning) return false;
			return true;
		}
		public function explode(_clicked:Boolean = false):void {
			play("dead");			
			Registry.expManager.firePlayer(x, y);
			Registry.ui.startChain();
			alive = false;
			exploding = true;
			explodingFrame = 0;	
		}
		
		public function setEmitter(_e:FlxEmitter):void {
			//emitter = _e;
		}
		
		internal var randx:uint, randy:uint;

		private function movement():void {
			
			if (x < -10) x = -10;
			else if (x > 440) x = 440;
			if (y < 30) y = 30;
			else if (y > 510) y = 510;
			//trace(x, y);
			//emitter.at(this);
			//emitter.y -= 4; 
			 
			//blur.draw();
			//if (respawning) move_speed *= 0.5;
			if (FlxG.keys.LEFT || FlxG.keys.A)
			{
				x -= move_speed;
			}
			else if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				x += move_speed;                
			}
			if(FlxG.keys.UP || FlxG.keys.W)
			{
				y -= move_speed;
			}
			else if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				y += move_speed;                
			}
			//if (respawning) move_speed *= 2;
			/*if (x < 0) x = 0;
			else if (x > _rightope) x = _rightope;
			if (y < 0) y = 0;
			else if (y > _downtope) y = _downtope;*/
		}
	}

}