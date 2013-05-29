package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	import util.XMLConfigKit.XMLVOMapper;
	import util.graphic.StyleManager;
	
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
			
			StyleManager.setShapeStyle(vo.style, graphics, vo);
			graphics.drawEllipse(0, 0, vo.width, vo.height);
			graphics.endFill();
			StyleManager.setEffects(this, vo.style); 
			
		}
		
	}
}