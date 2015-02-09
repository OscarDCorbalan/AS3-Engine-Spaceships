package com.hechoal.Biwair.engine 
{
	import org.flixel.FlxGame;
	import com.hechoal.Biwair.*;
	/**
	 * ...
	 * @author Oscar Dominguez Corbalan
	 */
	public class Engine extends FlxGame
	{
		
		public function Engine() 
		{
			super(450, 550, MenuState, 1,60,60,false);
		}
		
	}

}