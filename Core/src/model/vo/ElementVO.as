package model.vo
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	/**
	 * 元素模型
	 * 元素包括形状、图片、线条、文字、视频
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class ElementVO extends EventDispatcher
	{
		public var position:Point = new Point(0,0);
		
		public var height:Number = 50;
		
		public var width:Number = 50;
		
		public var type:String;
		
		public var id:uint = 0;
		
		private var _alpha:Number = 1;
		
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
	}
}