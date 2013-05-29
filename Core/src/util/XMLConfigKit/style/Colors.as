package util.XMLConfigKit.style
{
	import util.XMLConfigKit.Model;
	import util.XMLConfigKit.XMLVOMapper;
	import util.XMLConfigKit.style.elements.IFiElement;
	import util.XMLConfigKit.style.elements.IFreshElement;
	import util.XMLConfigKit.style.elements.IStyleElement;
	import util.graphic.StyleManager;

	/**
	 */	
	public class Colors implements IFiElement, IFreshElement, IStyleElement
	{
		public function Colors()
		{
		}
		
		/**
		 */		
		private var _style:String;

		public function get styleID():String
		{
			return _style;
		}

		/**
		 *  完全清空样色，重新添加新色系
		 */		
		public function set styleID(value:String):void
		{
			_style = XMLVOMapper.updateStyle(this, value, Model.COLORS);
		}

		/**
		 */
		public function get color():String
		{
			return null;
		}
		
		/**
		 */
		public function set color(value:String):void
		{
			values.push(StyleManager.getUintColor(value));
		}
		
		/**
		 */		
		public function fresh():void
		{
			values.length = 0;
		}
		
		/**
		 */		
		public function get length():uint
		{
			return values.length;
		}
		
		/**
		 * 根据颜色序号获取颜色值
		 */		
		public function getColor(index:uint):uint
		{
			return values[index];
		}
		
		/**
		 */		
		private var values:Vector.<int> = new Vector.<int>;

	}
}