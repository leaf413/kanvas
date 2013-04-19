package view.Element.shapes
{
	import model.vo.ShapeVO;
	
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
			
			shape.graphics.moveTo(vo.width / 5, 0);
			shape.graphics.lineTo(vo.width * 4 / 5,0);
			shape.graphics.lineTo(vo.width, vo.height);
			shape.graphics.lineTo(0, vo.height);
			shape.graphics.lineTo(vo.width / 5, 0);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(vo.width / 5, 0);
			frame.graphics.lineTo(vo.width * 4 / 5,0);
			frame.graphics.lineTo(vo.width, vo.height);
			frame.graphics.lineTo(0, vo.height);
			frame.graphics.lineTo(vo.width / 5, 0);
			frame.graphics.endFill();
		}
	}
}