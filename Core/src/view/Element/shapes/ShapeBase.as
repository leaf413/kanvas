package view.Element.shapes
{
	import flash.display.Shape;
	
	import model.vo.ShapeVO;
	
	import mx.states.OverrideBase;
	
	import util.XMLConfigKit.style.Style;
	
	import view.Element.ElementBase;
	
	/**
	 * 图形基类
	 * @author foxm
	 * 
	 */
	public class ShapeBase extends ElementBase
	{
		
		
		
		public function ShapeBase(vo:ShapeVO)
		{
			super(vo);
			this.vo = vo;
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			graphics.clear();
			alpha = (vo as ShapeVO).alpha;
			vo.style.tx = - vo.width / 2;
			vo.style.ty = - vo.height / 2;
			vo.style.width = vo.width;
			vo.style.height = vo.height;
		}
		
	}
}