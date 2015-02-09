package com.hechoal.Biwair
{
	import com.hechoal.Biwair.engine.*;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	[Frame(factoryClass="com.hechoal.Biwair.Preloader")]
	public class Main extends Sprite 
	{

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var game:Engine = new Engine;
			
			addChild(game);
		}

	}

}