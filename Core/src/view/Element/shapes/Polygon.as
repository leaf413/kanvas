package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
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
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.moveTo(startX, startY - radiusY);
			for (var i:uint = 1; i < 5; i ++)
			{
				rad = Math.PI / 2 + radPart * i;
				starX = startX + Math.cos(rad) * radiusX;
				starY = startY - Math.sin(rad) * radiusY;
				graphics.lineTo(starX, starY);
			}
			
			graphics.lineTo(startX, startY- radiusY);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}