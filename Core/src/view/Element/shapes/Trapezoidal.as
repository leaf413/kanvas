package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
	/**
	 * 梯形
	 * @author foxm
	 * 
	 */
	public class Trapezoidal extends ShapeBase
	{
		public function Trapezoidal(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.moveTo(vo.width / 5, 0);
			graphics.lineTo(vo.width * 4 / 5,0);
			graphics.lineTo(vo.width, vo.height);
			graphics.lineTo(0, vo.height);
			graphics.lineTo(vo.width / 5, 0);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}