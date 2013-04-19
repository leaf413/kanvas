package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	/**
	 * 星星
	 * @author foxm
	 * 
	 */
	public class Star extends ShapeBase
	{
		public function Star(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			var radio:Number = .5;
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			var radiusX:Number = vo.width / 2 ;
			var radiusY:Number = vo.height / 2 ;
			var startX:Number = radiusX;
			var startY:Number = radiusY;
			
			var outerStarX:Number;
			var outerStarY:Number;
			var innerStarX:Number;
			var innerStarY:Number;
			
			var rad:Number;
			var radPart:Number = Math.PI * 2 / 5;
			
			shape.graphics.moveTo(startX, startY - radiusY);
			frame.graphics.moveTo(startX, startY - radiusY);
			for (var i:uint = 1; i < 5; i ++)
			{
				// Inner.
				rad = Math.PI / 2 - radPart / 2 + radPart * i;
				outerStarX = startX + Math.cos(rad) * radiusX * radio;
				outerStarY = startY - Math.sin(rad) * radiusY * radio;
				shape.graphics.lineTo(outerStarX, outerStarY);
				frame.graphics.lineTo(outerStarX, outerStarY);
				// Outer
				rad = Math.PI / 2 + radPart * i;
				outerStarX = startX + Math.cos(rad) * radiusX;
				outerStarY = startY - Math.sin(rad) * radiusY;
				shape.graphics.lineTo(outerStarX, outerStarY);
				frame.graphics.lineTo(outerStarX, outerStarY);
			}
			
			rad = Math.PI / 2 - radPart / 2;
			outerStarX = startX + Math.cos(rad) * radiusX * radio;
			outerStarY = startY - Math.sin(rad) * radiusY * radio;
			
			shape.graphics.lineTo(outerStarX, outerStarY);
			shape.graphics.lineTo(startX, startY - radiusY);
			shape.graphics.endFill();
			
			
			frame.graphics.lineTo(outerStarX, outerStarY);
			frame.graphics.lineTo(startX, startY - radiusY);
			frame.graphics.endFill();
		}
	}
}