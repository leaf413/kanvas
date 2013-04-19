package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	/**
	 * 圆形
	 * @author foxm
	 * 
	 */
	public class Circle extends ShapeBase
	{
		public function Circle(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			shape.graphics.drawEllipse(0,0,vo.width,vo.height);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.drawEllipse(0,0,vo.width,vo.height);
			frame.graphics.endFill();
		}
	}
}