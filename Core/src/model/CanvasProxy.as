package model
{
	import model.vo.ElementVO;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import util.RenturnAndNext;
	import util.ShapeVORecord;
	import util.lib.ImageLib;
	
	/**
	 * 画布模型
	 * @author foxm
	 * 
	 */
	public class CanvasProxy extends Proxy
	{
		/**
		 * 画布颜色
		 */
		public var canvasColor:uint = 0xffffff;
		
		/**
		 * 保留上次属性设置
		 */
		public var shapeVORecord:ShapeVORecord = new ShapeVORecord();
		
		/**
		 * 当前元素VO
		 */
		private var _currentElementVO:ElementVO;
		
		/**
		 * 所有元素VO
		 */
		private var _allElementVOes:Vector.<ElementVO> = new Vector.<ElementVO>();
		
		/**
		 *存放图片库 
		 */
		public var imageMap:ImageLib = new ImageLib();
		
		
		/**
		 * 存放将要拷贝的形状
		 */
		public var copyMap:ElementVO;
		
		/**
		 * 前进返回控制
		 */
		public var renturnAndNext:RenturnAndNext = new RenturnAndNext();
		
		public function CanvasProxy(proxyName:String = null, data:Object = null)
		{
			super(proxyName, data);
		}
		
		/**
		 * 添加元素
		 * @param value
		 */
		public function addElement(value:ElementVO):void
		{
			allElementVOes.push(value);
		}
		
		/**
		 * 删除元素
		 * @param value
		 * 
		 */
		public function deleteElement(value:ElementVO):void
		{
			try
			{
				var index:int = allElementVOes.indexOf(value);
				if (index != -1)
				{
					allElementVOes.splice(index, 1);
				}
				
				
			}
			catch (err:Error)
			{
				trace("EditorFieldProxy->deleteShap" + err);
			}
		}
		
		/**
		 *删除所有元素 
		 * 
		 */
		public function removeAllShape():void
		{
			this.allElementVOes = null;
			this.allElementVOes = new Vector.<ElementVO>;
		}
		
		/**
		 * 设置所有元素
		 * @param value
		 */
		public function set allElementVOes(value:Vector.<ElementVO>):void 
		{
			_allElementVOes = value;
		}
		
		/**
		 * 获取所有元素
		 * @return 
		 */
		public function get allElementVOes():Vector.<ElementVO> 
		{
			return _allElementVOes;
		}
		
		/**
		 * 设置当前元素
		 * @param value
		 */
		public function set currentElementVO(value:ElementVO):void 
		{
			_currentElementVO = value;
		}
		
		/**
		 * 获取当前元素
		 * @return 
		 */
		public function get currentElementVO():ElementVO 
		{
			return _currentElementVO;
		}
	}
}