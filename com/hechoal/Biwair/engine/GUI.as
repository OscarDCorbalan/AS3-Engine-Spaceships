package com.hechoal.Biwair.engine 
{
	import org.flixel.FlxGroup;
	import com.hechoal.Biwair.Registry;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author ...
	 */
	public class GUI extends FlxGroup 
	{
		[Embed(source = '../../../../../assets/sprites/guioverlay.png')] private var guioverlay:Class;		
		protected var overlay1:FlxSprite = new FlxSprite(0, 0, guioverlay);
		protected var overlay2:FlxSprite = new FlxSprite(0, 520, guioverlay);
		
		protected var scoreTxt:FlxText = new FlxText(0, 0, 200);
		protected var oldScoreMult:uint;
		protected var respawnTxt:FlxText = new FlxText(180, 50, 200);
		protected var respawnCounter:uint;
		protected var scoreChain:uint = 0;
		protected var chainTimer:uint;	
		
		protected var minutes:uint = 0;
		protected var seconds:uint = 10;
		protected var timer:FlxText = new FlxText(200, 520, 150);		
		protected var timecount:FlxTimer = new FlxTimer(); 
		
		
		
		public function GUI(MaxSize:uint=0) 
		{
			super(MaxSize);
			
			scoreTxt.scrollFactor.x = 0;
			scoreTxt.scrollFactor.y = 0;
			scoreTxt.text = "Score: " + FlxG.score;
			scoreTxt.size = 20;
				
			respawnTxt.scrollFactor.x = 0;
			respawnTxt.scrollFactor.y = 0;
			respawnTxt.text = "" + 0;
			respawnTxt.size = 128;
			respawnTxt.alpha = 0.4;
			
			timer.size = 20;
			
			add(overlay1);
			add(overlay2);
			add(scoreTxt);
			add(timer);
			timecount.start(1, minutes*60 + seconds, nextSecond);
		//var dfasda:FlxSprite = new FlxSprite(
		}

		
		public function newScore(_s:uint):void {
			scoreTxt.text = "Score: " + FlxG.score;
		}
		
		override public function update():void {
			super.update();
			if (chainTimer > 0) checkChainTimer();
			
		}

		public function nextSecond(_t:FlxTimer):Boolean {
			if (seconds == 0 && minutes == 0) {
				timer.text = "das";
				return false;
			}
			else if (seconds == 0 && minutes > 0) {
				seconds = 60;
				minutes--;
			}
			else(seconds > 0)
				seconds--;
				
			if (seconds > 9) timer.text = minutes + ":" + seconds;
			else timer.text = minutes + ":0" + seconds;
			
			return true;
		}
		
		private function checkChainTimer():void {
			if(chainTimer > 0 ) chainTimer--;
		}
		
		public function startRespawnCounter(count:uint):void {
			Registry.playState.startShield();
			add(respawnTxt);
			respawnTxt.text = ""+count;
		}
		public function setRespawnCounter(count:uint):void {
			respawnTxt.text = ""+count;
		}
		public function stopRespawnCounter():void {
			Registry.playState.stopShield();
			remove(respawnTxt);	
		}
		
		public function startChain():void {
			oldScoreMult = 1;
			chainTimer = 100;
		}
		public function addChain():uint {
			scoreChain++;
			chainTimer = 100;
			if(oldScoreMult < 2560) oldScoreMult *= 2;
			Registry.playState.addScore(oldScoreMult);
			return oldScoreMult;
		}
	}

}