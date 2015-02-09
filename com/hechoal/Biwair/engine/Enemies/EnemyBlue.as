package com.hechoal.Biwair.engine.Enemies 
{
	import com.hechoal.Biwair.engine.Explosion;
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxCollision;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class EnemyBlue extends Enemy 
	{
		
		protected var immuneCounter:uint;
		protected var hitArray:Array = new Array();
		
		public function EnemyBlue() 
		{
			super();			
			loadGraphic(imgBlue, true,false, 21, 19);
			addAnimation("0", [0]);
			addAnimation("1", [1]);
			addAnimation("2", [2]);
			addAnimation("3", [3]);
			addAnimation("4", [4]);
			addAnimation("5", [5]);
			addAnimation("6", [6]);
			addAnimation("7", [7]);
			addAnimation("8", [8]);
			addAnimation("9", [9]);
			addAnimation("i", [10]);
			play("9");
		}
		
		/*override public function start(xx:int = 0, yy:int = 0, ff:int = 0):void {
			super.start(xx,yy,ff);		
			fp.y = 5;
			immuneCounter = 0;
			hitArray.splice(0);
			health = 7;
		}*/
		
		override public function explosionCheck(exp:Explosion):void {
			if (hitArray.length == 0 || hitArray.indexOf(exp) == -1) {
				if(FlxCollision.pixelPerfectCheck(this, exp, 127))
				{
					hitArray.push(exp);
					health--;
					immuneCounter = 50;						
					switch(health) {
						case 8: play("8"); break;
						case 7: play("7"); break;
						case 6: play("6"); break;
						case 5: play("5"); break;
						case 4: play("4"); break;
						case 3: play("3"); break;
						case 2: play("2"); break;
						case 1: play("1"); break;
						case 0: explode(); break;
					}
				}			
			}
		}
		
		override public function update():void 
		{
			super.update();			
			if (immuneCounter > 0){
				immuneCounter--;					
				if (immuneCounter == 0) {
					hitArray.splice(0);
					trace("ARRAY LENGTH " + hitArray.length);
				}
			}	
				
		}
		
		
	}

}