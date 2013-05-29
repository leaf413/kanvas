package view
{
	import controller.event.CanvasEvent;
	import controller.event.ElementEvent;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import model.vo.ElementVO;
	import model.vo.LineVO;
	
	import mx.events.DragEvent;
	
	import util.Draw.DrawEvent;
	import util.Draw.DrawLine;
	import util.Draw.DrawRect;
	import util.StageUtil;
	
	import view.Element.ElementBase;
	
	/**
	 * 画布
	 * 存放所有图形容器
	 * @author foxm
	 * 
	 */
	public class Canvas extends Sprite
	{
//		/**
//		 * 背景
//		 */
//		private var bg:Sprite;
		
		/**
		 * 内容边界
		 */
		private var _bound:Rectangle;
		
		/**
		 * 预览(画元素、拖动元素的虚影)
		 */
		public var preView:Sprite;
		
		/**
		 * 当前元素
		 */
		private var _currentElement:ElementBase;
		
		/**
		 * 元素容器
		 */
		private var elementsContainer:Sprite;
		
		/**
		 * 画虚线
		 */
		private var drawline:DrawLine;
		
		/**
		 * 画矩形虚线框
		 */
		private var drawBrokenRect:DrawRect;
		
		/**
		 * 画矩形框
		 */
		private var drawRect:DrawRect;
		
		public function Canvas()
		{
			super();
			StageUtil.initApplication(this, init);
		}
		
		/**
		 * 初始化
		 */
		private function init():void
		{
			_bound = new Rectangle();
			
			elementsContainer = new Sprite();
			this.addChild(elementsContainer);
			
			preView = new Sprite();
			this.addChild(preView);
			
			currentElement = null;
			
			drawline = new DrawLine(preView, DrawLine.STYLE_BROKEN);
			
			drawBrokenRect = new DrawRect(preView, DrawRect.STYLE_BROKEN);
			
			drawRect = new DrawRect(preView);
		}
		
		/**
		 * 清理预览
		 */
		public function cleanPreView():void
		{
			while (preView.numChildren)
				preView.removeChildAt(0);
		}
		
		/**
		 * 回复preView坐标
		 */
		public function cleanPreViewPosition():void
		{
			preView.x = 0;
			preView.y = 0;
		}
		
		/**
		 * 获取层次
		 * @param element
		 * @return 
		 * 
		 */
		public function getChildIndexElement(element:ElementBase):int
		{
			return elementsContainer.getChildIndex(element);
		}
		
		/**
		 * 设置层次
		 * @param element
		 * @param index
		 * 
		 */
		public function setChildIndexElement(element:ElementBase, index:int):void
		{
			elementsContainer.setChildIndex(element, index);
		}
		
		/**
		 * 向上一层
		 */
		public function bringForward(element:ElementBase):void
		{
			elementsContainer.setChildIndex(element, elementsContainer.getChildIndex(currentElement) + 1);
		}
		
		/**
		 * 最上层
		 */
		public function bringToFront(element:ElementBase):void
		{
			elementsContainer.setChildIndex(element, elementsContainer.numChildren - 1);
		}
		
		/**
		 * 最下层
		 */
		public function sendToBack(element:ElementBase):void
		{
			elementsContainer.setChildIndex(element, 0);
		}
		
		/**
		 * 向下一层
		 */
		public function sendBackWard(element:ElementBase):void
		{
			elementsContainer.setChildIndex(element, elementsContainer.getChildIndex(currentElement) - 1);
		}
		
		
		/**
		 * 得到当前元素
		 * @return 
		 * 
		 */
		public function get currentElement():ElementBase
		{
			return _currentElement;
		}
		
		/**
		 * 设置当前元素
		 * @param value
		 * 
		 */
		public function set currentElement(value:ElementBase):void
		{
			_currentElement = value;
			if (!_currentElement)
				dispatchEvent(new ElementEvent(ElementEvent.UNSELECT_ELEMENT));
		}
		
//		/**
//		 * 渲染背景
//		 */
//		public function renderBG(w:Number = 0, h:Number = 0, color:uint = 0xffffff):void
//		{
//			if (!bg)
//			{
//				bg = new Sprite();
//				this.addChild(bg);
//			}
//				
//			bg.graphics.clear();
//			bg.graphics.beginFill(color, 1);
//			bg.graphics.drawRect(0, 0, w, h);
//			bg.graphics.endFill();
//		}
		
		/**
		 * 添加元素
		 * @param elements
		 * 
		 */
		public function addElement(elements:ElementBase):void
		{
			elements.render();
			elementsContainer.addChild(elements);
			updateBound();
		}
		
		/**
		 * 清除画布内所有元素
		 */
		public function clearElements():void
		{
			while (elementsContainer.numChildren)
				elementsContainer.removeChildAt(0);
		}
		
		/**
		 * 所有元素
		 * @return 
		 */
		public function get allElement():Vector.<ElementBase>
		{
			var elements:Vector.<ElementBase> = new Vector.<ElementBase>();
			var length:uint = elementsContainer.numChildren;
			
			for (var i:uint = 0; i < length; i ++)
			{
				elements.push((elementsContainer.getChildAt(i) as ElementBase));
			}
			
			return elements;
		}
		
		/**
		 * 更新边界
		 */
		public function updateBound():void
		{
			_bound = elementsContainer.getBounds(this);
			
			var leftTop:Point = new Point(_bound.x, _bound.y);
			var rightTop:Point = new Point(_bound.x + _bound.width, _bound.y);
			var leftBottom:Point = new Point(_bound.x, _bound.y + _bound.height);
			var rightBottom:Point = new Point(_bound.x + _bound.width, _bound.y + _bound.height);
		}
		
		/**
		 * 获取边界宽度
		 * @return 
		 * 
		 */
		public function getBoundWidth():Number
		{
			if (_bound)
			{
				return _bound.width;
			}
			else
			{
				return 0;
			}
		}
		
		/**
		 * 获取边界高度
		 * @return 
		 * 
		 */
		public function getBoundHeight():Number
		{
			
			if (_bound)
			{
				return _bound.height;
			}
			else
			{
				return 0;
			}
		}
		
		/**
		 * 获取边框
		 * @return 
		 * 
		 */
		public function get bound():Rectangle 
		{
			return _bound;
		}
		
		/******************************************************
		 * 
		 * 预览画线
		 * 
		 ******************************************************/
		
		/**
		 *创建线条 
		 * 
		 */
		public function startdrawLine():void
		{
			drawline.startdrawLine();
		}
		
		/**
		 * 创建画虚线框
		 */
		public function startCreatBrokenRect():void
		{
			drawBrokenRect.startCreatRect();
		}
		
		/**
		 *创建多选框 
		 * 
		 */
		public function starCreatRect():void
		{
			drawRect.startCreatRect();
		}
		
	}
}