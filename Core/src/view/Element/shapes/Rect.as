package view.Element.shapes
{
	import model.vo.ShapeVO;

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
			
			shape.graphics.drawRoundRect(0, 0,vo.width , vo.height , 10, 10);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.drawRoundRect(0, 0,vo.width , vo.height , 10, 10);
			frame.graphics.endFill();
		}
	}
}