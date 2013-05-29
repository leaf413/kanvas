package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
	/**
	 * 双箭头
	 * @author foxm
	 * 
	 */
	public class DoubleArrow extends ShapeBase
	{
		public function DoubleArrow(vo:ShapeVO)
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
			graphics.moveTo(0, vo.height / 2);
			graphics.lineTo(vo.width / 3,0);
			graphics.lineTo(vo.width / 3, vo.height / 3);
			graphics.lineTo(vo.width * 2 / 3, vo.height / 3);
			graphics.lineTo(vo.width * 2 / 3, 0);
			graphics.lineTo(vo.width, vo.height / 2);
			graphics.lineTo(vo.width * 2 / 3, vo.height);
			graphics.lineTo(vo.width * 2 / 3, vo.height * 2 / 3);
			graphics.lineTo(vo.width / 3, vo.height * 2 / 3);
			graphics.lineTo(vo.width / 3, vo.height);
			graphics.lineTo(0, vo.height / 2);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}