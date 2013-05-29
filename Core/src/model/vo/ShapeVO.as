package model.vo
{
	import flash.events.IEventDispatcher;
	
	import model.vo.interfaceVO.Ilock;
	
	import util.graphic.StyleManager;
	
	/**
	 * 形状模型
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class ShapeVO extends ElementVO implements Ilock
	{
		
		/**
		 * 边框透明度
		 */
		private var _frameAlpha:Number = 1;
		
		/**
		 * 边框粗细
		 */
		private var _thickness:uint = 1;
		
		/**
		 * 边框颜色
		 */
		private var _frameColor:uint = 0x728F1C;
		
		/**
		 * 内填充颜色
		 */
		private var _color:Object = 0x728F1C;
		
		/**
		 * 标题
		 */
		private var _label:String = "";
		
		public function ShapeVO(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * 设置边框透明度
		 */
		public function set frameAlpha(value:Number):void 
		{
			if (isLock)
				return;
			_frameAlpha = value;
		}
		
		/**
		 * 获取边框透明度
		 * @return 
		 * 
		 */
		public function get frameAlpha():Number 
		{
			return _frameAlpha;
		}
		
		/**
		 * 设置透明度
		 * @param value
		 * 
		 */
		override public function set alpha(value:Number):void
		{
			if (isLock)
				return;
			super.alpha = value;
		}
		
		/**
		 * 设置边框粗细
		 * @param value
		 * 
		 */
		public function set thickness(value:uint):void 
		{
			if (isLock)
				return;
			_thickness = value;
		}
		
		/**
		 * 获取边框粗细
		 * @return 
		 */
		public function get thickness():uint 
		{
			return _thickness;
		}
		
		/**
		 * 设置边框颜色
		 * @param value
		 * 
		 */
		public function set frameColor(value:uint):void 
		{
			if (isLock)
				return;
			_frameColor = value;
		}
		
		/**
		 * 获取边框颜色
		 * @return 
		 * 
		 */
		public function get frameColor():uint 
		{
			return _frameColor;
		}
		
		/**
		 * 设置颜色值
		 * @param value
		 * 
		 */
		public function set color(value:Object):void
		{
			if (isLock)
				return;
			
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