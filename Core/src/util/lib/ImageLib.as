package util.lib
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import util.system.GC;

	/**
	 */	
	public class ImageLib
	{

		/**
		 * 输出插入的bitmap及同步shape ID 
		 * 
		 * @param value
		 * @param value2
		 */
		public function setBitmap(id:String, bitmap:Bitmap):void 
		{
			dictionary[id] = bitmap;
		}
		
		/**
		 *给ID返回对应图片 
		 */
		public function  getBitmap(value:String):Bitmap 
		{
			return dictionary[value];
		}
		
		/**
		 * 清空图片库
		 */		
		public function cleanAllBitmap():void
		{
			dictionary = new Dictionary();
			GC.run();
		}
		
		/**
		 * 存放图片
		 */		
		public var dictionary:Dictionary = new Dictionary();
		
		/**
		 */		
		private var _id:int = 0;
		
		/**
		 * 设置初始图片ID
		 */		
		public function setBaseID(value:uint):void
		{
			_id = value;
		}
		
		/**
		 * 获取图片ID
		 */		
		public function get id():int 
		{
			_id += 1;
			return _id;
		}
	}
}