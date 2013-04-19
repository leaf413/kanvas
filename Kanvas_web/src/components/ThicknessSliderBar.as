package components
{
	import flash.display.Shape;
	import flash.geom.Point;
	
	import skins.ThicknessSliderBarSkin;
	
	import mx.controls.TextInput;
	
	import spark.components.supportClasses.SliderBase;
	import spark.primitives.BitmapImage;
	import spark.primitives.Path;
	
	public class ThicknessSliderBar extends SliderBase
	{
		[SkinPart(required="false")]
		public var bar:BitmapImage;
		
		[SkinPart(required="false")]
		public var triangle:Path;
		
		//遮罩
		private var _barMask:Shape;
		
		public function ThicknessSliderBar()
		{
			super();
			setStyle('skinClass', ThicknessSliderBarSkin);
		}
		
		override protected function pointToValue(x:Number, y:Number):Number
		{
			if (!thumb || !track)
				return 0;
			
			var range:Number = maximum - minimum;
			var thumbRange:Number = track.getLayoutBoundsWidth() - thumb.getLayoutBoundsWidth();
			return minimum + ((thumbRange != 0) ? (x / thumbRange) * range : 0); 
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
			if(instance == triangle){
				_barMask = new Shape();
				triangle.mask = _barMask;
			}
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
			
			if(_barMask){
				_barMask.graphics.clear();
				_barMask.graphics.beginFill(0x000000);
				
				var mW:Number = track.getLayoutBoundsWidth() * value / range;
				var mH:Number = track.getLayoutBoundsHeight();
				_barMask.graphics.drawRect(0, 0, mW, mH);
				triangle.visible = (_barMask.width <= 25) ? false : true;
			}
			
			/*if(triangle){
				var w:Number = track.getLayoutBoundsWidth() * value / range;
				triangle.data = 'M 0 12 L ' + (w - 10) + ' 12 L ' + (w - 10) + ' 2 L 2 12';
			}*/
		}
	}
}