package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
	/**
	 * 三角形
	 * @author foxm
	 * 
	 */
	public class Triangle extends ShapeBase
	{
		public function Triangle(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			var startX:Number = vo.width / 2 ;
			var startY:Number = vo.height / 2 ;
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.moveTo(startX, startY - vo.height / 2 );
			graphics.lineTo(startX - vo.width / 2 , startY + vo.height / 2 );
			graphics.lineTo(startX + vo.width / 2 , startY + vo.height / 2 );
			graphics.lineTo(startX , startY - vo.height / 2 );
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}