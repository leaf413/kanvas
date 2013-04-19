package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	/**
	 * 六边形
	 * @author foxm
	 * 
	 */
	public class Hexagon extends ShapeBase
	{
		public function Hexagon(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			var hw:Number = (vo.height / 2) * Math.sqrt(3) /3.5;
			shape.graphics.moveTo(0, vo.height / 2);
			shape.graphics.lineTo(hw,0);
			shape.graphics.lineTo(vo.width - hw, 0);
			shape.graphics.lineTo(vo.width, vo.height / 2);
			shape.graphics.lineTo(vo.width - hw, vo.height);
			shape.graphics.lineTo(hw, vo.height);
			shape.graphics.lineTo(0, vo.height / 2);
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(0, vo.height / 2);
			frame.graphics.lineTo(hw,0);
			frame.graphics.lineTo(vo.width - hw, 0);
			frame.graphics.lineTo(vo.width, vo.height / 2);
			frame.graphics.lineTo(vo.width - hw, vo.height);
			frame.graphics.lineTo(hw, vo.height);
			frame.graphics.lineTo(0, vo.height / 2);
			frame.graphics.endFill();
		}
	}
}