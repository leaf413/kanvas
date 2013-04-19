package components
{
	import skins.PercentSliderSkin;
	
	import spark.components.supportClasses.SliderBase;
	import spark.primitives.BitmapImage;
	import flash.geom.Point;
	
	public class PercentSlider extends SliderBase
	{
		[SkinPart(required="false")]
		public var bar:BitmapImage;
		
		public function PercentSlider()
		{
			super();
			stepSize = 0.01;
			minimum = 0;
			maximum = 1;
			setStyle('skinClass', PercentSliderSkin);
		}
		
		override protected function pointToValue(x:Number, y:Number):Number
		{
			if (!thumb || !track)
				return 0;
			
			var range:Number = maximum - minimum;
			var thumbRange:Number = track.getLayoutBoundsWidth() - thumb.getLayoutBoundsWidth();
			return minimum + ((thumbRange != 0) ? (x / thumbRange) * range : 0); 
		}
		
		override protected function updateSkinDisplayList():void
		{
			if (!thumb || !track)
				return;
			
			var thumbRange:Number = track.getLayoutBoundsWidth() - thumb.getLayoutBoundsWidth();
			var range:Number = maximum - minimum;
			
			// calculate new thumb position.
			var thumbPosTrackX:Number = (range > 0) ? ((pendingValue - minimum) / range) * thumbRange : 0;
			
			// convert to parent's coordinates.
			var thumbPos:Point = track.localToGlobal(new Point(thumbPosTrackX, 0));
			var thumbPosParentX:Number = thumb.parent.globalToLocal(thumbPos).x;
			
			thumb.setLayoutBoundsPosition(Math.round(thumbPosParentX), thumb.getLayoutBoundsY());
			
			if(bar){
				bar.width = track.getLayoutBoundsWidth() * value / range;
				bar.visible = (bar.width <= 7) ? false : true;
			}
		}
	}
}