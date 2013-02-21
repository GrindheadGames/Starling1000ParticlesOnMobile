package{
	import com.grindheadgames.demo.Game;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF(width="640", height="960", frameRate="30", backgroundColor="#ffffff")]
	
	public class StarlingMobileTest extends Sprite
	{
		public static const VERSION:String = '1.0.0',
							WIDTH:Number = 640,
							HEIGHT:Number = 960,
							FRAMERATE:uint = 30;
		
		private var _starling:Starling;
		
		public function StarlingMobileTest()
		{
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight)
			
			_starling = new Starling(Game, stage,viewPort);
			_starling.start();
			_starling.showStats = true;
			_starling.stage.stageWidth  = WIDTH >> 1;
			_starling.stage.stageHeight = HEIGHT >> 1;
		}
	}
}
