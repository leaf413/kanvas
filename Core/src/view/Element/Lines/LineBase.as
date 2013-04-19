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
		/**
		 * 线条容器
		 */
		protected var line:Sprite;
		
		public function LineBase(vo:LineVO)
		{
			line = new Sprite();
			super(vo);
			this.addChild(line);
		}
		
	}
}