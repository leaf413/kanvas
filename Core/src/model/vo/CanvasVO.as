package model.vo
{
	import util.graphic.StyleManager;

	/**
	 * 画布VO
	 * @author MC102
	 * 
	 */
	public class CanvasVO extends ElementVO
	{
		/**
		 * 内填充颜色
		 */
		private var _color:Object = '0#fffffff';
		
		public function CanvasVO()
		{
		}
		
		/**
		 * 设置颜色值
		 * @param value
		 * 
		 */
		public function set color(value:Object):void
		{
			
			_color = StyleManager.setColor(value);
		}
		/**
		 *  获取颜色值
		 * @return 
		 * 
		 */
		public function get color():Object
		{
			return _color;
		}
	}
}