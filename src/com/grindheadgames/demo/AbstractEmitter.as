package com.grindheadgames.demo
{
	import com.grindheadgames.utils.Utils;
	
	import starling.core.Starling;
	import starling.display.Stage;
	import starling.extensions.Particle;
	import starling.extensions.ParticleSystem;
	import starling.textures.Texture;

	public class AbstractEmitter extends ParticleSystem
	{
		// texture for particle
		private var _lifeSpan:Number = 30.0;
		
		public function AbstractEmitter(texture:Texture, emissionRate:Number,initialCapacity:int=128, maxCapacity:int=8192, blendFactorSource:String=null, blendFactorDest:String=null, lifeSpan:Number = int.MAX_VALUE, totalParticles:int = 0)
		{
			this._lifeSpan = lifeSpan;
			super(texture,emissionRate,initialCapacity,maxCapacity,blendFactorSource,blendFactorDest);
			
			// this is a main part of this tutorial
			// we initialize all our stars, and don't wait juggler
			mNumParticles = totalParticles;
			
			var w:Number = Starling.current.stage.stageWidth;
			
			for (var i:int = 0; i < totalParticles; ++i) {
				// get every particle
				var particle:AbstractParticle = mParticles[i] as AbstractParticle;
				// initialize it
				initParticle(particle);
				var rand:Number = Math.random();
				// place every star on whole stageWidth
				particle.x = w * rand;
				// decrease a totalTime of star, because we moved it
				particle.totalTime *= 1.0 - rand;
			}
		}
		
		/**
		 * Create out own particle class instead default
		 */
		override protected function createParticle():Particle {
			return new AbstractParticle();
		}
		
		/**
		 * This function will initialize particle every time it start its life
		 */
		override protected function initParticle(_particle:Particle):void {
			var particle:AbstractParticle = _particle as AbstractParticle;
			var st:Stage = Starling.current.stage;
			
			// reset current time to zero
			particle.currentTime = 0.0;
			// randomize life time 30 + 30 * [-0.5, 0.5] = [15, 45]
			particle.totalTime = lifeSpan + lifeSpan * (Math.random() - 0.5);
			
			// randomize size of star [1.0, 2.5]
			particle.scale = Utils.randRange(.5,1);
			// place star outsize of left bound
			particle.x =-mTexture.width * 0.5 * particle.scale;
			// randomize vertical placement of star
			particle.y = st.stageHeight * Math.random();
			// calculate speed, we need add speed*pasedTime to `x` on every advance
			// in the end we should be outside of right bound
			particle.speed = ((st.stageWidth + mTexture.width * particle.scale) - particle.x) / particle.totalTime;
		}
		
		/**
		 * Advance every star
		 * when currentTime will be more then totalTime, star will go to
		 * initParticle method and all start again
		 */
		override protected function advanceParticle(_particle:Particle, passedTime:Number):void {
			var particle:AbstractParticle = _particle as AbstractParticle;
			particle.x += particle.speed * passedTime;
			particle.currentTime += passedTime;
		}

		public function get lifeSpan():Number
		{
			return _lifeSpan;
		}
	}
}