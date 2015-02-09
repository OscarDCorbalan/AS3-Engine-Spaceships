package com.hechoal.Biwair.engine 
{
	import org.flixel.FlxSprite;
	import com.hechoal.Biwair.Registry;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Shield extends FlxSprite 
	{
		[Embed(source = "../../../../../assets/sprites/shield.png")] private var img:Class;
		
		protected var i:uint;
		
		public function Shield() 
		{
			exists = false;
			loadGraphic(img, true, false, 78,78,true);
		}
		
		override public function update():void 
		{
			super.update();
			for (i = 0; i < Registry.bullets.length; i++)
			{
				if (Registry.bullets.members[i]!= null && Registry.bullets.members[i].exists)
					Registry.bullets.members[i].shieldCheck(this);
			}
		}	
	}

}