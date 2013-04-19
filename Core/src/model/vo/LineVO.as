package model.vo
{
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	/**
	 * 线条模型
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class LineVO extends ElementVO
	{
		/**
		 * 开始点
		 */
		public var startPoint:Point;
		
		/**
		 * 结束点
		 */
		public var endPoint:Point;
		
		/**
		 * 标题
		 */
		private var _label:String = "";
		
		/**
		 * 边框粗细
		 */
		private var _thickness:uint = 1;
		
		/**
		 * 内填充颜色
		 */
		private var _color:uint = 0x728F1C;
		
		/**
		 * 开始点箭头
		 */
		private var _startArrow:Boolean = false;
		
		/**
		 * 结束点箭头
		 */
		private var _endArrow:Boolean = false;
		
		public function LineVO(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * 设置线条粗细
		 * @param value
		 * 
		 */
		public function set thickness(value:uint):void 
		{
			_thickness = value
		}
		
		/**
		 * 获取线条粗细
		 * @return 
		 * 
		 */
		public function get thickness():uint 
		{
			return _thickness;
		}
		
		/**
		 * 设置线条颜色
		 * @param value
		 */
		public function set color(value:uint):void 
		{
			_color = value;
		}
		
		/**
		 * 获取线条颜色
		 * @return 
		 */
		public function get color():uint 
		{
			return _color;
		}
		
		/**
		 * 获取是否显示开始点箭头
		 * @return 
		 */
		public function get startArrow():Boolean 
		{
			return _startArrow;
		}
		
		/**
		 * 设置是否显示开始点箭头
		 * @param value
		 */
		public function set startArrow(value:Boolean):void 
		{
			_startArrow = value;
		}
		
		/**
		 * 获取是否显示结束点箭头
		 * @return 
		 * 
		 */
		public function get endArrow():Boolean 
		{
			return _endArrow;
		}
		
		/**
		 * 设置是否显示结束点箭头
		 * @param value
		 * 
		 */
		public function set endArrow(value:Boolean):void 
		{
			_endArrow = value;
		}
		
		/**
		 * 设置标题
		 * @param value
		 * 
		 */
		public function set label(value:String):void
		{
			_label = value;
		}
		
		/**
		 * 获取标题
		 * @return 
		 * 
		 */
		public function get label():String
		{
			return _label;
		}
	}
}