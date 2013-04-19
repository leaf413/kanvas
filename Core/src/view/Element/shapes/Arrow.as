package view.Element.shapes
{
	import model.vo.ShapeVO;
	
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
			
			shape.graphics.moveTo(0, vo.height / 4);
			shape.graphics.lineTo(vo.width / 2, vo.height / 4);
			shape.graphics.lineTo(vo.width / 2, 0);
			shape.graphics.lineTo(vo.width, vo.height / 2);
			shape.graphics.lineTo(vo.width / 2, vo.height);
			shape.graphics.lineTo(vo.width / 2, vo.height * 3 / 4);
			shape.graphics.lineTo(0, vo.height * 3 / 4);
			shape.graphics.lineTo(0, vo.height / 4);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(0, vo.height / 4);
			frame.graphics.lineTo(vo.width / 2, vo.height / 4);
			frame.graphics.lineTo(vo.width / 2, 0);
			frame.graphics.lineTo(vo.width, vo.height / 2);
			frame.graphics.lineTo(vo.width / 2, vo.height);
			frame.graphics.lineTo(vo.width / 2, vo.height * 3 / 4);
			frame.graphics.lineTo(0, vo.height * 3 / 4);
			frame.graphics.lineTo(0, vo.height / 4);
			frame.graphics.endFill();
		}
	}
}