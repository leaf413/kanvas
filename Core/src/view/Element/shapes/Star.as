package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
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
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.moveTo(startX, startY - radiusY);
			for (var i:uint = 1; i < 5; i ++)
			{
				// Inner.
				rad = Math.PI / 2 - radPart / 2 + radPart * i;
				outerStarX = startX + Math.cos(rad) * radiusX * radio;
				outerStarY = startY - Math.sin(rad) * radiusY * radio;
				graphics.lineTo(outerStarX, outerStarY);
				// Outer
				rad = Math.PI / 2 + radPart * i;
				outerStarX = startX + Math.cos(rad) * radiusX;
				outerStarY = startY - Math.sin(rad) * radiusY;
				graphics.lineTo(outerStarX, outerStarY);
			}
			
			rad = Math.PI / 2 - radPart / 2;
			outerStarX = startX + Math.cos(rad) * radiusX * radio;
			outerStarY = startY - Math.sin(rad) * radiusY * radio;
			
			graphics.lineTo(outerStarX, outerStarY);
			graphics.lineTo(startX, startY - radiusY);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}