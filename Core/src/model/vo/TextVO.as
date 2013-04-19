package model.vo
{
	import flash.events.IEventDispatcher;
	
	/**
	 * 文字数据
	 * @author foxm
	 */
	[Bindable]
	public class TextVO extends ElementVO
	{
		/**
		 * 文字
		 */
		public var label:String = "";
		
		/**
		 * 文字颜色
		 */
		private var _color:Number = 0;
		
		/**
		 * 自动换行
		 */		
		private var _wordWrap:Boolean = false;
		
		/**
		 * 下划线
		 */
		private var _underline:Boolean = false;
		
		/**
		 * 字体加粗
		 */
		private var _isBold:Boolean = false;
		
		/**
		 * 字体加粗
		 */
		private var _fontSize:Number = 12;
		
		/**
		 * 字体样式
		 */
		private var _font:String = "宋体";
		
		/**
		 * 文字对齐
		 */		
		private var _align:String = "left";
		
		/**
		 * 文字倾斜
		 */
		private var _italic:Boolean = false;
		
		
		public function TextVO(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		/**
		 * 自动换行
		 */
		public function get wordWrap():Boolean
		{
			return _wordWrap;
		}
		
		/**
		 * 自动换行
		 * @private
		 */
		public function set wordWrap(value:Boolean):void
		{
			_wordWrap = value;
		}
		
		/**
		 * 字体加粗
		 */
		public function get bold():Boolean
		{
			return _isBold;
		}
		
		/**
		 * 字体加粗
		 * @private
		 */
		public function set bold(value:Boolean):void
		{
			_isBold = value;
		}
		
		/**
		 * 字体大小
		 */
		public function get size():Number
		{
			return _fontSize;
		}
		
		/**
		 * 字体大小
		 * @private
		 */
		public function set size(value:Number):void
		{
			_fontSize = value;
		}
		
		/**
		 * 字体样式
		 */
		public function get font():String
		{
			return _font;
		}
		
		/**
		 *  字体样式
		 * @private
		 */
		public function set font(value:String):void
		{
			_font = value;
		}
		
		/**
		 * 文字对齐
		 */
		public function get align():String
		{
			return _align;
		}
		
		/**
		 * 文字对齐
		 * @private
		 */
		public function set align(value:String):void
		{
			_align = value;
		}
		
		/**
		 *  字体倾斜
		 * @param value
		 */
		public function set italic(value:Boolean):void 
		{
			_italic = value;
		}
		
		/**
		 * 字体倾斜
		 */		
		public function get italic():Boolean 
		{
			return _italic;
		}
		
		/**
		 * 字体下划线
		 * @param value
		 * 
		 */
		public function set underline(value:Boolean):void 
		{
			_underline = value;
			
		}
		
		/**
		 * 字体下划线
		 */
		public function get underline():Boolean 
		{
			return _underline;
		}
		
		/**
		 * 设置字体颜色
		 * @param value
		 * 
		 */
		public function set color(value:Number):void
		{
			_color = value;
		}
		
		/**
		 * 获取字体颜色
		 * @return 
		 * 
		 */
		public function get color():Number
		{
			return _color;
		}
	}
}