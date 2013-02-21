package com.grindheadgames.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Utils
	{
		public static function hasAnimation(mc:MovieClip, _animationFrameLabel:String):Boolean
		{
			var hasAnimation:Boolean = false;
			
			for( var i:int; i < mc.currentLabels.length; i ++)
			{
				if( (mc.currentLabels[i] as FrameLabel).name == _animationFrameLabel)
				{
					hasAnimation = true;
				}
			}
			
			return hasAnimation;
		}
		
		public static function get randomBoolean():Boolean
		{
			return Math.random() >= 0.5;
		}
		
		public static function randRange(low:Number,high:Number):Number
		{
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
		
		public static function floor(n:Number):Number
		{
			var ni:int = n;
			return (n < 0 && n != ni) ? ni - 1 : ni;
		}
		
		public static function round(n:Number):Number
		{
			return n < 0 ? n + .5 == (n | 0) ? n : n - .5 : n + .5;
		}
		
		public static function ciel(n:Number):Number
		{
			var ni:int = n;
			return (n >= 0 && n != ni) ? ni + 1 : ni;
		}
		
		public static function positionPanels(panels:Array, maxHeight:Number, startX:Number, startY:Number, xSpacing:Number, ySpacing:Number ):void
		{
			var xPos:Number = startX,
				yPos:Number = startY;
			
			maxHeight += startY;
			
			for(var i:Number = 0; i < panels.length; i ++ )
			{
				panels[i].x = xPos;
				panels[i].y = yPos;
				
				yPos += ySpacing;
				
				if( yPos >= maxHeight )
				{
					yPos = startY;
					xPos += xSpacing;
				}
			}
		}
		
		public static function getAngle (x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy,dx);
		}
		
		public static function distanceBetweenDisplayObjects(p1:DisplayObject, p2:DisplayObject):Number
		{	
			var x_cord:Number 			= p1.x - p2.x; 
			var	y_cord:Number 			= p1.y - p2.y;
			
			var distance:Number 		= Math.round(Math.sqrt(x_cord*x_cord + y_cord*y_cord));
			
			return distance;
		}
		
		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * 180/Math.PI;
		}
		
		public static function degreesToRadians(degrees:Number):Number
		{
			return degrees * Math.PI / 180;
		}
		
		/**
		 * this function rounds the x,y positions of a mc and all its children using recursion. Using whole numbers avoids blurring.
		 * @param displayObjectContainer
		 * 
		 */		
		
		public static function roundPositionsOfDisplayObjectAndChildren(displayObjectContainer:DisplayObjectContainer):void
		{
			if (!(displayObjectContainer is Stage)) {
				displayObjectContainer.x = Math.round(displayObjectContainer.x);
				displayObjectContainer.y = Math.round(displayObjectContainer.y);
			}
			for (var i:uint = 0; i < displayObjectContainer.numChildren; i++) {
				var child:DisplayObject = displayObjectContainer.getChildAt(i);
				if (child is DisplayObjectContainer) {
					roundPositionsOfDisplayObjectAndChildren(child as DisplayObjectContainer);
				} else {
					child.x = Math.round(child.x);
					child.y = Math.round(child.y);
				}
			}
		}
		
		//gets the length of an object
		public static function getLength(o:Object):uint
		{
			var len:uint = 0;
			for (var item:* in o)
					len++;
			return len;
		}
		
		public static function toObject(a:Array):Object
		{
			var o:Object = new Object();
			
			for(var i:int = 0; i < a.length; i++)
			{
				o[i] = a[i];	
			}
			return o;
		}
		
		public static function toArray(o:Object):Array
		{
			var a:Array = [];
			var l:int = Utils.getLength(o);
			
			for(var i:int = 0; i < l; i++)
			{
				a.push( o[i] );
			}
			return a;
		}
	}
}