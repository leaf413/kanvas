package model.vo
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import util.XMLConfigKit.XMLVOMapper;
	import util.XMLConfigKit.style.Style;
	import util.XMLConfigKit.style.elements.IStyleElement;
	
	/**
	 * 元素模型
	 * 元素包括形状、图片、线条、文字、视频
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class ElementVO extends EventDispatcher implements IStyleElement
	{
		public var x:Number = 0;
		
		public var y:Number = 0;
		
		public var height:Number = 50;
		
		public var width:Number = 50;
		
		public var type:String;
		
		public var id:uint = 0;
		
		private var _alpha:Number = 1;
		
		private var _styleTempType:String = '';
		
		public var property:String = '';
		
		/**
		 */		
		private var _style:Style;
		
		/**
		 * 
		 */
		private var _styleID:String;
		
		/**
		 * 是否锁定
		 */
		private var _isLock:Boolean = false;
		
		public function ElementVO(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * 设置透明度
		 * @param value
		 * 
		 */
		public function set alpha(value:Number):void 
		{
			_alpha = value;
		}
		
		/**
		 * 获取透明度
		 * @return 
		 * 
		 */
		public function get alpha():Number 
		{
			return _alpha;
		}
		
		/**
		 * 设置是否锁定
		 * @param value
		 * 
		 */
		public function set isLock(value:Boolean):void
		{
			_isLock = value;
		}
		
		/**
		 * 获取是否锁定
		 * @return 
		 */
		public function get isLock():Boolean
		{
			return _isLock;
		}
		
		/**
		 */
		public function get style():Style
		{
			return _style;
		}
		
		/**
		 * @private
		 */
		public function set style(value:Style):void
		{
			_style = value;
		}
		
		/**
		 *  style 采取的是继承模式，更新原有样
		 */
		public function set styleID(value:String):void
		{
			_styleID = XMLVOMapper.updateStyle(this, value, type);		
		}		
		
		/**
		 */
		public function get styleID():String
		{
			return _styleID;
		}
		
		/**
		 * 元素样式模版
		 * @return 
		 * 
		 */
		public function get styleTempType():String 
		{
			return _styleTempType;
		}
		
		public function set styleTempType(value:String):void 
		{
			_styleTempType = value
		}
	}
}