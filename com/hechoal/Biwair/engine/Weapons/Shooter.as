package com.hechoal.Biwair.engine.Weapons 
{
	import com.hechoal.Biwair.engine.Enemies.EnemyMagenta;
	import org.flixel.FlxSprite;
	import com.hechoal.Biwair.Registry;
	/**
	 * ...
	 * @author ...
	 */
	public class Shooter extends FlxSprite 
	{
		[Embed(source = "../../../../../../assets/sprites/magentaShooter.png")] protected var img:Class;
		
		protected var mother:EnemyMagenta;
		
		public function Shooter(_m:EnemyMagenta) 
		{
			super();
			health = 1;
			exists = false;
			mother = _m;
			loadGraphic(img, false, false, 6, 6);
		}
		
		public function start():void {
			alive = true;
			exists = true;
			Registry.overlord.add(this);
		}
		
		public function stop():void {
			alive = false;
			exists = false;
			Registry.overlord.remove(this);
		}
		
		protected var dx:int;
		protected var dy:int;
		protected var sr:Number;
		override public function update():void 
		{
			super.update();
			if (mother == null) return;
			dx = Registry.player.x - mother.x;
			dy = Registry.player.y - mother.y;
			sr = Math.sqrt( dx*dx + dy*dy);
			x = 9+mother.x + (dx<<4) / sr;
			y = 9+mother.y + (dy<<4) / sr;
		}
		
	}

}