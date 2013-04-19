package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	/**
	 * 多边形
	 * @author foxm
	 * 
	 */
	public class Polygon extends ShapeBase
	{
		public function Polygon(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			var radiusX:Number = vo.width / 2 ;
			var radiusY:Number = vo.height / 2 ;
			var startX:Number = radiusX;
			var startY:Number = radiusY;
			
			var starX:Number;
			var starY:Number;
			var rad:Number;
			var radPart:Number = Math.PI * 2 / 5;
			
			shape.graphics.moveTo(startX, startY - radiusY);
			frame.graphics.lineStyle((vo as ShapeVO).thickness,(vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(startX, startY - radiusY);
			for (var i:uint = 1; i < 5; i ++)
			{
				rad = Math.PI / 2 + radPart * i;
				starX = startX + Math.cos(rad) * radiusX;
				starY = startY - Math.sin(rad) * radiusY;
				shape.graphics.lineTo(starX, starY);
				frame.graphics.lineTo(starX, starY);
			}
			
			shape.graphics.lineTo(startX, startY- radiusY);
			shape.graphics.endFill();
			
			frame.graphics.lineTo(startX, startY- radiusY);
			frame.graphics.endFill();
		}
	}
}