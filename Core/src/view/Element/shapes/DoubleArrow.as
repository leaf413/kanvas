package view.Element.shapes
{
	import model.vo.ShapeVO;
	
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
			
			shape.graphics.moveTo(0, vo.height / 2);
			shape.graphics.lineTo(vo.width / 3,0);
			shape.graphics.lineTo(vo.width / 3, vo.height / 3);
			shape.graphics.lineTo(vo.width * 2 / 3, vo.height / 3);
			shape.graphics.lineTo(vo.width * 2 / 3, 0);
			shape.graphics.lineTo(vo.width, vo.height / 2);
			shape.graphics.lineTo(vo.width * 2 / 3, vo.height);
			shape.graphics.lineTo(vo.width * 2 / 3, vo.height * 2 / 3);
			shape.graphics.lineTo(vo.width / 3, vo.height * 2 / 3);
			shape.graphics.lineTo(vo.width / 3, vo.height);
			shape.graphics.lineTo(0, vo.height / 2);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(0, vo.height / 2);
			frame.graphics.lineTo(vo.width / 3,0);
			frame.graphics.lineTo(vo.width / 3, vo.height / 3);
			frame.graphics.lineTo(vo.width * 2 / 3, vo.height / 3);
			frame.graphics.lineTo(vo.width * 2 / 3, 0);
			frame.graphics.lineTo(vo.width, vo.height / 2);
			frame.graphics.lineTo(vo.width * 2 / 3, vo.height);
			frame.graphics.lineTo(vo.width * 2 / 3, vo.height * 2 / 3);
			frame.graphics.lineTo(vo.width / 3, vo.height * 2 / 3);
			frame.graphics.lineTo(vo.width / 3, vo.height);
			frame.graphics.lineTo(0, vo.height / 2);
			frame.graphics.endFill();
		}
	}
}