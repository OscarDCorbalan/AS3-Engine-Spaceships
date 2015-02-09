package com.hechoal.Biwair 
{
	import com.hechoal.Biwair.engine.*;
	import com.hechoal.Biwair.engine.Enemies.*;
	import flash.geom.Rectangle;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.*;
	
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class GameState extends FlxState
	{
		[Embed(source = "../../../../assets/planets/bg.png")] private var planet1:Class;
		[Embed(source = "../../../../assets/planets/galaxy1.png")] private var galaxy1:Class;
		[Embed(source = "../../../../assets/planets/bgStars1.png")] private var bgStars1:Class;
		[Embed(source = "../../../../assets/planets/bgStars2.png")] private var bgStars2:Class;
		[Embed(source = "../../../../assets/planets/nebulas.png")] private var nebulas1:Class;
		[Embed(source = "../../../../assets/planets/nube1.png")] private var nube1:Class;
		[Embed(source = "../../../../assets/planets/nube2.png")] private var nube2:Class;
		[Embed(source = '../../../../assets/sounds/soundtrack.mp3')] private var soundtrack:Class;
		
		protected var 	_i:uint,_j:uint;_k:uint;						
		protected var shield:Shield = new Shield();
		public var shieldActive:Boolean = false;
		protected var countframes:uint = 0;
		protected var pEmitter:FlxEmitter;
		protected var pParticle:FlxParticle;
		protected var starField:StarfieldFX;
		protected var stars:FlxSprite;
		protected var 	p1FS:FlxSprite,
						galaxy:FlxSprite,
						stars1:FlxSprite,
						stars2:FlxSprite,
						nuvol1:FlxSprite,
						nuvol2:FlxSprite,
						nebulas:FlxSprite,
						background:FlxSprite;						
		protected var backDrop:FlxScrollZone;
			
		
		public function GameState(){}
		
		protected var nextFactor:uint = 200;
		protected var currFactor:int = 1;
		protected var spawnRatio:uint = 100;
		public function addScore(_s:int, plusone:Boolean = false):void {
			FlxG.score += _s;
			
			Registry.ui.newScore(FlxG.score); 		
		}		
		
		protected var 	cratio:Number = 0,
						bratio:Number = 0,
						mratio:Number = 0,
						rratio:Number = 0,
						yratio:Number = 0,
						doubleratio:Number = 0;
		override public function create():void
		{
			if (Registry.upgrades.yellowUnlocked == true)
				yratio = Registry.upgrades.yellowChance;
			if (Registry.upgrades.redUnlocked == true)
				rratio = Registry.upgrades.redChance;	
			if (Registry.upgrades.magentaUnlocked == true)
				mratio = Registry.upgrades.magentaChance;
			Registry.playState = this;
			Registry.overlord = new Overlord();
			Registry.puma = new PowerupManager();
			Registry.expManager = new ExplosionManager();
			Registry.player = new Player();
			Registry.bullets = new BulletManager();
			Registry.ui = new GUI();
			Registry.textManager = new FlxGroup();
			
			if (FlxG.getPlugin(FlxSpecialFX) == null)
				FlxG.addPlugin(new FlxSpecialFX);
			
			createStarField();
			createBackDrop();
						
			add(nebulas);	
			add(stars);
            add(stars1);
			add(stars2);			
			add(p1FS);
			add(Registry.expManager);
			add(Registry.bullets);
			add(Registry.overlord);
			add(Registry.puma);
			add(Registry.player); //playa			
			add(nuvol2);
			add(nuvol1);			
			add(Registry.ui);
			FlxG.play(soundtrack);
		
		}
		
		protected var _sptmp:Number, _xtmp:Number;
		
						
		override public function update():void 
		{
			super.update();
			
			checkKeys();		
			launchShips();
			countframes++;				
			if (shieldActive) {
				shield.x = Registry.player.x-28;
				shield.y = Registry.player.y-28;				
			}
			
			if (Registry.player.isHitable()){
				FlxG.overlap(Registry.player, Registry.overlord, overlapDetected, FlxCollision.pixelPerfectCheck);
				FlxG.overlap(Registry.player, Registry.bullets, overlapDetected, FlxCollision.pixelPerfectCheck);
				FlxG.overlap(Registry.player, Registry.puma, getPowerup, FlxCollision.pixelPerfectCheck);
			}
		}
		
		protected var _muteTimer:uint = 0;
		protected function checkKeys():void {
			if (_muteTimer > 0) {
				_muteTimer--;
				return;
			}
			if (FlxG.keys.M)
			{
				FlxG.mute = !FlxG.mute;
				_muteTimer = 16;
			}
		}
		
		public function launchShips():void {
			if (countframes % spawnRatio == 0) {
				Registry.overlord.fireShip(rollShip);
			}
		}
		
		protected var dice:Number;
		protected function rollShip():Class {			
			dice = Math.floor( Math.random() * 100);
			if (dice < yratio)	return EnemyYellow;
			else if (dice < yratio + rratio) return EnemyRed;
			else if (dice < yratio + rratio + mratio) return EnemyMagenta;
			return EnemyGreen;
		}
		
		private function getPowerup(Object1:FlxObject, Object2:FlxObject):void {
			//PUFactor(Object2).getMe();			
		}
		
		private function overlapDetected(Object1:FlxObject, Object2:FlxObject):void {
			Registry.player.explode();			
		}
		override public function postUpdate():void 
		{
			super.postUpdate();			
			//FlxG.collide(player, overlord, collision);
		}
		
		protected var _enemy:Enemy;
		protected function explodeEnemy(Object1:FlxObject, _e:FlxObject):void {
			trace("explode");
			_enemy = _e as Enemy;
			_enemy.explode();
		}
		
		protected function createBackDrop():void {
			p1FS = new FlxSprite(0, 0, planet1);
			galaxy = new FlxSprite(0, 0, galaxy1);
			stars1 = new FlxSprite(0, 0, bgStars1);
			stars2 = new FlxSprite(0, 0, bgStars2);
			nuvol1 = new FlxSprite(0, 0, nube1);
			nuvol2 = new FlxSprite(0, 0, nube2);
			nebulas = new FlxSprite(0, 0, nebulas1);
			
            //    If the FlxScrollZone Plugin isn't already in use, we add it here
            if (FlxG.getPlugin(FlxScrollZone) == null) {
				FlxG.addPlugin(new FlxScrollZone); 
			}
            
			//FlxScrollZone.add(galaxy, new Rectangle(0, 0, galaxy.width, galaxy.height), 0, 0.1, true, true);
			FlxScrollZone.add(nebulas, new Rectangle(0, 0, nebulas.width, nebulas.height), 0, 0.08, true, true);							
			FlxScrollZone.add(stars1, new Rectangle(0, 0, stars1.width, stars1.height), 0, 0.16, true, true);
			FlxScrollZone.add(stars2, new Rectangle(0, 0, stars2.width, stars2.height), 0, 0.20, true, true);
			FlxScrollZone.add(p1FS, new Rectangle(0, 0, p1FS.width, p1FS.height), 0, 0.8, true, true);			
			FlxScrollZone.add(nuvol2, new Rectangle(0, 0, nuvol2.width, nuvol2.height), 0, 2, true, true);	
			FlxScrollZone.add(nuvol1, new Rectangle(0, 0, nuvol1.width, nuvol1.height), 0, 3, true, true);
			FlxScrollZone.startScrolling();
		}
		protected function createStarField():void {			
			starField = FlxSpecialFX.starfield();
			//FlxSpecialFX.starfield.
			starField.setStarSpeed(0, 0.1);
			
			stars = starField.create(0, 0, 450, 550, 1000, 1);	
			starField.setStarDepthColors(5, 0x999B5858, 0xfff4f4c4);
			starField.setBackgroundColor(0x00);

		}

		public function startShield():void {
			shieldActive = true;
			add(shield);
			shield.revive();
		}
		public function stopShield():void {
			shieldActive = false;			
			remove(shield);
			shield.kill();
		}
		
	}

}