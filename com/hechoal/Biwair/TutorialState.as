package com.hechoal.Biwair 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class TutorialState extends ScreenState 
	{
		[Embed(source = "../../../../assets/staticbg/bgTutorial.jpg")] private var bgTuto:Class;
		
		
		
		public function TutorialState(){}
		
		override public function create():void 
		{
			add(new FlxSprite(0, 0, bgTuto));			
			super.create();
			title.text = "Tutorial";
			
		}
		
		override protected function playClick():void {			
			FlxG.mouse.hide();
			FlxG.switchState(new UpgradeState());	
		}
	}

}