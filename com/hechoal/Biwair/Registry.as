package com.hechoal.Biwair 
{
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	import com.hechoal.Biwair.*;
	import com.hechoal.Biwair.engine.*;
	import com.hechoal.Biwair.UpgradeChart.Upgrades;
	import flash.display.Stage;
	import org.flixel.*;
        
        public class Registry 
        {
                public static var stage:Stage;
                public static var upgrades:Upgrades;
                public static var player:Player;
                public static var overlord:Overlord;
				public static var puma:PowerupManager;
                public static var expManager:ExplosionManager;
				public static var bullets:BulletManager;
				public static var playState:GameState;
				public static var ui:GUI;
				public static var textManager:FlxGroup;
				
                public static var previousLevel:int;
                public static var enemiesKilledThisLevel:int;
                public static var enemiesKilledThisGame:int;
                public static var arrowsFiredThisGame:int;
				
				public static var _curExplosion:Explosion;
				
				public static var speedFactor:Number = 1;
				
				public static var money:int = 0;
				
                public function Registry() 
                {
                }
                
        }

}