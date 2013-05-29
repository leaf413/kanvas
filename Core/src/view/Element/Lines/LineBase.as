package view.Element.Lines
{
	import flash.display.Sprite;
	
	import model.vo.LineVO;
	
	import view.Element.ElementBase;
	
	/**
	 * 线条基类
	 * @author foxm
	 * 
	 */
	public class LineBase extends ElementBase
	{
		
		public function LineBase(vo:LineVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			graphics.clear();
			alpha = (vo as LineVO).alpha;
			vo.style.tx = - vo.width / 2;
			vo.style.ty = - vo.height / 2;
			vo.style.width = vo.width;
			vo.style.height = vo.height;
		}
		
	}
}