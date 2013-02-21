package com.grindheadgames.demo{
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			var cows:Cows = new Cows();
			cows.start();
			
			var logos:Logo = new Logo();
			logos.start();
			
			Starling.juggler.add(cows);
			Starling.juggler.add(logos);
			
			addChild(logos);
			addChild(cows);
			
		}
	}
}


