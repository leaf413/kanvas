package view.Element
{
	import controller.event.ElementEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import model.vo.ElementVO;
	
	import util.BrokenLineDrawer;
	
	import view.Element.state.ElementMultiSelected;
	import view.Element.state.ElementSelected;
	import view.Element.state.ElementState;
	import view.Element.state.ElementUnSelected;
	
	/**
	 * 元素基类
	 * 元素包括、图片、形状、视频、线条、文字
	 * @author foxm
	 * 
	 */
	public class ElementBase extends Sprite
	{
		/**
		 * 数据
		 */
		public var vo:ElementVO;
		
		/**
		 * 背景 
		 */
		protected var bg:Sprite;
		
		/**
		 * 当前状态
		 */
		public var currentState:ElementState;
		
		/**
		 * 选中状态
		 */
		public var selectedState:ElementState;
		
		/**
		 * 没选中状态
		 */
		public var unSelectedState:ElementState;
		
		/**
		 * 多选状态
		 */
		public var multiSelectedState:ElementState;
		
		/**
		 *当前拖动图形镜像 
		 */
		private var mirror:Sprite;
		
		public function ElementBase(vo:ElementVO)
		{
			this.vo = vo;
			
			bg = new Sprite();
			addChildAt(bg, 0);
			setShapeBGisShow(false);
			init();
		}
		
		/**
		 * 初始化
		 */
		private function init():void
		{
			doubleClickEnabled = true;
			initListen();
			initState();
		}
		
		/**
		 * 初始化监听
		 */
		private function initListen():void
		{
			mouseChildren = false;
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, downHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
//			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);
		}
		
		/**
		 * 清理镜像
		 */
		public function cleanMirror():void
		{
			if (mirror)
			{
				while (mirror.numChildren)
					mirror.removeChildAt(0);
				mirror = null;
			}
		}
		

		/**
		 * 准备拖动元素
		 * @param preView
		 * 
		 */
		public function startDragElement(preView:Sprite):void
		{
			preView.x = this.x;
			preView.y = this.y;
			var shape:Shape = new Shape();
			shape.graphics.clear();
			shape.graphics.beginFill(0xe0e0e0, 0.5);
			var leftTop:Point = new Point(0, 0);
			var rightTop:Point = new Point(width + 1, 0);
			var leftBottom:Point = new Point(0, height);
			var rightBottom:Point = new Point(width + 1, height);
			
			BrokenLineDrawer.drawLine(shape.graphics, leftTop, new Point(rightTop.x, rightTop.y), 1, 0, 5);
			BrokenLineDrawer.drawLine(shape.graphics, rightTop, rightBottom, 1, 0, 5);
			BrokenLineDrawer.drawLine(shape.graphics, leftBottom, rightBottom, 1, 0, 5);
			BrokenLineDrawer.drawLine(shape.graphics, leftTop, new Point(leftBottom.x, leftBottom.y), 1, 0, 5);
			
//			shape.graphics.drawRect(0, 0, vo.width, vo.height);
			shape.graphics.endFill();
			preView.addChild(shape);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler, false, 0, true);
		}
		

		/**
		 * 拖动元素
		 * @param preView
		 * 
		 */
		public function dragingElement(preView:Sprite):void
		{
			preView.startDrag();
		}
		
		/**
		 * 停止拖动元素
		 * @param preView
		 * 
		 */
		public function stopDragElement(preView:Sprite):void
		{
//			moveTo(new Point(preView.x,preView.y));
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			preView.stopDrag();
		}
		
		/**
		 * 移动去
		 * @param value
		 * 
		 */
		public function moveTo(value:Point):void
		{
			vo.x = value.x;
			vo.y = value.y;
			updateLayout();
			dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
		}
		
		/**
		 * 记录属性更改
		 */
		protected function changeRecord():void
		{
			var e:ElementEvent = new ElementEvent(ElementEvent.CHANGE_RECORD, this);
			dispatchEvent(e);
		}
		
		/**
		 * 按住CTRL点击
		 */
		protected function ctrlClickHandler():void
		{
		}
		
		/**
		 * 按下元素
		 */
		protected function downHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			
			if (evt.ctrlKey)
			{
				ctrlClickHandler();
			}
			else
			{
				currentState.mouseDown();
			}
			
		}
		
		/**
		 * 鼠标弹起元素
		 */
		protected function mouseUpHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			currentState.mouseUp();
		}
		
		/**
		 * 移动元素
		 */
		protected function mouseMoveHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			currentState.mouseMove();
		}
		
		/**
		 * 双击
		 */
		protected function doubleClickHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			this.vo.isLock = false;
			currentState.doubleClick();
		}
		
		/**
		 * 鼠标离开元素
		 */
		protected function mouseOutHandler(evt:MouseEvent):void
		{
			currentState.mouseOut();
		}
		
		/**
		 * 鼠标经过元素
		 */
		protected function mouseOverHandler(evt:MouseEvent):void
		{
			currentState.mouseOver();
		}
		
		/**
		 * 初始化状态
		 */
		protected function initState():void
		{
			selectedState = new ElementSelected(this);
			unSelectedState = new ElementUnSelected(this);
			multiSelectedState = new ElementMultiSelected(this);
			
			currentState = unSelectedState;
		}
		
		/**
		 * 进入选中状态
		 */
		public function toSelectedState():void
		{
			currentState.toSelected();
			dispatchEvent(new ElementEvent(ElementEvent.CURRENT_ELEMENT, this));
			setShapeBGisShow(true);
		}
		
		/**
		 * 进入没选中状态
		 */
		public function toUnSelectedState():void
		{
			currentState.toUnSelected();
			setShapeBGisShow(false);
		}
		
		/**
		 * 进入多选状态
		 */
		public function toMultiSelectedState():void
		{
			currentState.toMultiSelection();
		}
		
		/**
		 * 更新布局
		 */
		public function updateLayout():void
		{
			this.x = vo.x;
			this.y = vo.y;
		}
		
		/**
		 * 画背景
		 */
		public function drawBG():void
		{
			bg.graphics.clear();
			bg.graphics.beginFill(0xe0e0e0, 0.2);
			bg.graphics.drawRect(0, 0, vo.width, vo.height);
			bg.graphics.endFill();
		}
		
		/**
		 *	设置背景是否显示 
		 * 
		 */
		public function setShapeBGisShow(isShow:Boolean):void
		{
			isShow ? bg.alpha = 1 : bg.alpha = 0;
		}
		
		/**
		 * 渲染
		 */
		public function render():void
		{
			updateLayout();
			drawBG();
		}
		
		/**
		 * 删除自身
		 */
		public function deleteSelf():void
		{
			if (this.parent)
				this.parent.removeChild(this);
		}
		
	}
}