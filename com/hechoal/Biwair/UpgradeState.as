package com.hechoal.Biwair 
{
	/**
	 * ...
	 * @author ...
	 */
	import com.hechoal.Biwair.UpgradeChart.Upgrades;
	import flash.events.MouseEvent;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	public class UpgradeState extends ScreenState 
	{
		[Embed(source = "../../../../assets/staticbg/bgUpgrade.jpg")] private var background:Class;
		
		[Embed(source = "../../../../assets/sprites/buttons/backInactive.png")] private var backbut:Class;
		[Embed(source = "../../../../assets/sprites/buttons/backHover.png")] private var backbuthov:Class;
		
		protected var upgrades:Upgrades;
		public function UpgradeState(){}
		
		override public function create():void
		{
			add(new FlxSprite(0, 0, background));	
			var btnBack:FlxButtonPlus = new FlxButtonPlus(116, 519, backClick, null, "Back", 50, 16);
			btnBack.loadGraphic(new FlxSprite(0, 0, backbut), new FlxSprite(0, 0, backbuthov));
			
			super.create();			
			
			title.text = "Upgrades";
			add(btnBack);
			
			upgrades = Registry.upgrades;
			
			add(upgrades);
			//FlxG.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}		

		
		protected function backClick():void {
			FlxG.mouse.hide();
			FlxG.switchState(new MenuState());	
		}
		
		override protected function playClick():void {
			FlxG.mouse.hide();
			FlxG.switchState(new GameState());	
		}
		
	}

}