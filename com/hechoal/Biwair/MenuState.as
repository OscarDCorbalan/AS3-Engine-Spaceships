package com.hechoal.Biwair 
{
	import com.hechoal.Biwair.UpgradeChart.Upgrades;
	import flash.geom.Rectangle;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class MenuState extends FlxState
	{
		private var startButton:FlxButtonPlus;
		private var points:uint = 0;
		
		public function MenuState() 
		{
			
		}
		protected var starField:StarfieldFX;
		
		[Embed(source = "../../../../assets/planets/bgStars1.png")] private var bgStars1:Class;
		[Embed(source = "../../../../assets/planets/bgStars2.png")] private var bgStars2:Class;
		[Embed(source = "../../../../assets/planets/nube1.png")] private var nube1:Class;
		[Embed(source = "../../../../assets/planets/nube2.png")] private var nube2:Class;
		[Embed(source = "../../../../assets/sprites/menuButton.png")] private var menubut:Class;
		[Embed(source = "../../../../assets/sprites/menuButtonHover.png")] private var menubuthov:Class;
		
		[Embed(source = "../../../../assets/menubg.png")] private var menubg:Class;
		protected var 	stars1:FlxSprite,
						stars2:FlxSprite,
						nuvol1:FlxSprite,
						nuvol2:FlxSprite,
						title:FlxSprite;
		
		override public function create():void
		{
			FlxG.flashFramerate = 30;
			
			stars1 = new FlxSprite(0, 0, bgStars1);
			stars2 = new FlxSprite(0, 0, bgStars2);
			nuvol1 = new FlxSprite(0, 0, nube1);
			nuvol2 = new FlxSprite(0, 0, nube2);
			add(stars1);
			add(stars2);
			add(nuvol1);
			add(nuvol2);
			
			var instructions:FlxText;
			instructions = new FlxText(0, 450, FlxG.width, "Press M to mute");
			instructions.setFormat (null, 12, 0xFFFFFFFF, "center");
			add(instructions);
			
			title = new FlxSprite(0, 0, menubg);			
			add(title);
			
			var btnStart:FlxButtonPlus = new FlxButtonPlus(165, 150, newGameClick, null, "New Game", 120, 20);
			btnStart.loadGraphic(new FlxSprite(0,0,menubut), new FlxSprite(0,0,menubuthov));
			
			add(btnStart);
			
			createscroll();
			FlxG.mouse.show();
		}
 
		private function createscroll():void{
			if (FlxG.getPlugin(FlxScrollZone) == null) {
				FlxG.addPlugin(new FlxScrollZone); 
			}						
			FlxScrollZone.add(stars1, new Rectangle(0, 0, stars1.width, stars1.height), 0, 1, true, true);
			FlxScrollZone.add(stars2, new Rectangle(0, 0, stars2.width, stars2.height), 0, 2, true, true);
			FlxScrollZone.add(nuvol2, new Rectangle(0, 0, nuvol2.width, nuvol2.height), 0, 2, true, true);	
			FlxScrollZone.add(nuvol1, new Rectangle(0, 0, nuvol1.width, nuvol1.height), 0, 3, true, true);
		}
		
		private function newGameClick():void {
			FlxScrollZone.clear();
			stars1.destroy();
			stars2.destroy();
			nuvol1.destroy();
			nuvol2.destroy();
			Registry.upgrades = new Upgrades();
			FlxG.mouse.hide();
			FlxG.switchState(new TutorialState());			
		}

	}

}