package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
	/**
	 * 箭头形状
	 * @author foxm
	 * 
	 */
	public class Arrow extends ShapeBase
	{
		public function Arrow(vo:ShapeVO)
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
			graphics.moveTo(0, vo.height / 4);
			graphics.lineTo(vo.width / 2, vo.height / 4);
			graphics.lineTo(vo.width / 2, 0);
			graphics.lineTo(vo.width, vo.height / 2);
			graphics.lineTo(vo.width / 2, vo.height);
			graphics.lineTo(vo.width / 2, vo.height * 3 / 4);
			graphics.lineTo(0, vo.height * 3 / 4);
			graphics.lineTo(0, vo.height / 4);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
			
		}
	}
}