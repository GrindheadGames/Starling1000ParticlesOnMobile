package com.grindheadgames.demo{
	import flash.display3D.Context3DBlendFactor;
	
	import starling.textures.Texture;
	
	/**
	 * This is stars particle system
	 */
	public class Logo extends AbstractEmitter {
		
		private static const NUM_PARTICLES:int = 500,
							 LIFESPAN:Number = StarlingMobileTest.FRAMERATE;
		
		[Embed( source="../../../../assets/logo.png" )]
		private var Logo:Class;
		
		public function Logo() {
			super(Texture.fromBitmap( new Logo ), NUM_PARTICLES / LIFESPAN, NUM_PARTICLES, NUM_PARTICLES,
				Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA,LIFESPAN,NUM_PARTICLES);
		}
	}
}

