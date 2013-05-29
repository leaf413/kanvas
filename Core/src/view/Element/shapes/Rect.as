package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;

	/**
	 * 矩形
	 * @author foxm
	 */
	public class Rect extends ShapeBase
	{
		public function Rect(vo:ShapeVO)
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
			graphics.drawRoundRect(0, 0,vo.width , vo.height , 10, 10);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
		}
	}
}