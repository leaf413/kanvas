package model.vo
{
	import flash.display.Bitmap;
	import flash.events.IEventDispatcher;
	
	import model.vo.interfaceVO.Ilock;
	
	/**
	 * 图片
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class ImageVO extends ElementVO implements Ilock
	{
		
		/**
		 * 图片 
		 */
		private var _bitmap:Bitmap = new Bitmap();
		
		/**
		 * 图片ID 
		 */
		private var _bitmapID:int = 0;
		
		public function ImageVO(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		/**
		 * 设置图片ID
		 * @param value
		 * 
		 */
		public function set bitmapID(value:int):void 
		{
			_bitmapID = value;
		}
		
		/**
		 * 获取图片ID
		 * @return 
		 * 
		 */
		public function get bitmapID():int 
		{
			return _bitmapID;
		}
		
		/**
		 * 设置图片
		 * @param value
		 * 
		 */
		public function set setBitmap(value:Bitmap):void 
		{
			_bitmap = value;
		}
		
		/**
		 *获取图片 
		 * @return 
		 * 
		 */
		public function get getBitmap():Bitmap 
		{
			return _bitmap;
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
	}
}