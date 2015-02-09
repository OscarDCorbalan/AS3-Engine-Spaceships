package com.hechoal.Biwair.UpgradeChart 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	/**
	 * ...
	 * @author ...
	 */
	public class Upgrades extends FlxGroup
	{
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/yellowShipOff.png")] private var ysOff:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/yellowShipHover.png")] private var ysHov:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/yellowShipOn.png")] private var ysOn:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/redShipOff.png")] private var rsOff:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/redShipHover.png")] private var rsHov:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/redShipOn.png")] private var rsOn:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/magentaShipOff.png")] private var msOff:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/magentaShipHover.png")] private var msHov:Class;
		[Embed(source = "../../../../../assets/sprites/buttons/upgrades/magentaShipOn.png")] private var msOn:Class;
		
		//levels
		public var explosions:int = 0;
		public var time:int = 0;
		public var squads:int = 0;		
		public var bosses:int = 0;
		
		public var yellowUnlocked:Boolean = false;
		public var yellowChance:int = 0;
		public var yellowLifeChance:int = 0;
		public var yellowSquadsize:int = 0;
		
		public var redUnlocked:Boolean = false;
		public var redChance:int = 0;
		public var redSpeed:int = 0;
		public var redSpeedTimer:int = 0;
		
		public var magentaUnlocked:Boolean = true;
		public var magentaChance:int = 0;
		//public var magentaSpeed:int = 0;
		//public var magenta
		
		
		protected var yellowShipButton:FlxButtonPlus = new FlxButtonPlus(0,0,null);
		protected var yellowShipSprite:FlxSprite;
		protected var redShipButton:FlxButtonPlus;
		protected var redShipSprite:FlxSprite;
		protected var magentaShipButton:FlxButtonPlus;
		protected var magentaShipSprite:FlxSprite;
		
		public function Upgrades() 
		{
			yellowShipButton = addButton(73, 213, buyYellowShip, ysOff, ysHov);
			redShipButton = addButton(73, 273, buyRedShip, rsOff, rsHov);
			magentaShipButton = addButton(73, 333, buyMagentaShip, msOff, msHov);
			
			
		}
		
		protected function buyMagentaShip():void {
			addSprite(magentaShipSprite, magentaShipButton.x, magentaShipButton.y, msOn, magentaShipButton);
			magentaUnlocked = true;
			magentaChance = 4;
			
		}
		
		protected function buyYellowShip():void {					
			addSprite(yellowShipSprite,yellowShipButton.x,yellowShipButton.y, ysOn, yellowShipButton);
			yellowUnlocked = true;
			yellowChance = 12;
		}
		
		protected function buyRedShip():void {
				
			addSprite(redShipSprite, redShipButton.x, redShipButton.y, rsOn,redShipButton);
			redUnlocked = true;
			redChance = 6;
		}
		
		protected function addSprite(s:FlxSprite, x:int, y:int, o:Class,r:FlxButtonPlus):void {
			s = new FlxSprite(x, y, o);
			remove(r);
			add(s);
		}
		
		protected function addButton(x:int, y:int, f:Function, o:Class, h:Class):FlxButtonPlus {
			var b:FlxButtonPlus = new FlxButtonPlus(x, y, f);
			b.loadGraphic(new FlxSprite(0, 0, o), new FlxSprite(0, 0, h));
			
			add(b);			
			return b;
		}
		
	}

}