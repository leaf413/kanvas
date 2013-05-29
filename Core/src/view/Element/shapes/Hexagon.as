package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.graphic.StyleManager;
	
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
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.moveTo(0, vo.height / 2);
			graphics.lineTo(hw,0);
			graphics.lineTo(vo.width - hw, 0);
			graphics.lineTo(vo.width, vo.height / 2);
			graphics.lineTo(vo.width - hw, vo.height);
			graphics.lineTo(hw, vo.height);
			graphics.lineTo(0, vo.height / 2);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style, vo); 
		}
	}
}