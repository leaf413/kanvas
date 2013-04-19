package view
{
	import controller.commands.CommandNames;
	import controller.event.CanvasEvent;
	import controller.event.ElementEvent;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import model.keyboard.KeyboardDefaultSate;
	import model.keyboard.KeyboardStateBase;
	import model.keyboard.KeyboardTextState;
	import model.vo.ElementVO;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import util.canvasControl.MoveCanvas;
	import util.canvasControl.ZoomCanvas;
	
	import view.Element.ElementBase;
	
	/**
	 * 画布代理
	 * @author foxm
	 * 
	 */
	public class CanvasMediator extends Mediator
	{
		/**
		 * 移动屏幕控制
		 */
		public var moveCanvas:MoveCanvas;
		
		/**
		 * 缩放控制
		 */
		private var zoomCanvas:ZoomCanvas;
		
		/**
		 *当前键盘状态 
		 */
		public var currentKeyboardState:KeyboardStateBase;
		
		/**
		 * 默认键盘状态
		 */
		public var defaultKeyboardState:KeyboardDefaultSate;
		
		/**
		 * 文本输入时键盘状态
		 */
		public var textKeyboardState:KeyboardTextState;
		
		public function CanvasMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			canvas.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			moveCanvas = new MoveCanvas(canvas);
			zoomCanvas = new ZoomCanvas(canvas, canvas.bound);
			keyBoardState();
			
			canvas.addEventListener(MouseEvent.CLICK,mouseHandler,false,0,true);
			canvas.addEventListener(MouseEvent.MOUSE_WHEEL,mouseHandler,false,0,true);
			canvas.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpBoardHandler, false, 0, true);
			canvas.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownBoardHandler, false, 0, true);
			
			canvas.addEventListener(ElementEvent.CURRENT_ELEMENT, setCurrentElement, false, 0, true);
			canvas.addEventListener(ElementEvent.MOUSE_DOWN, downElement, false, 0, true);
			canvas.addEventListener(ElementEvent.MOUSE_OVER_EDIT_TEXT, overEditText, false, 0, true);
			canvas.addEventListener(ElementEvent.MOUSE_OUT_EDIT_TEXT, overEditText, false, 0, true);
			canvas.addEventListener(ElementEvent.MOUSE_UP, stopMoveElement, false, 0, true);
			canvas.addEventListener(ElementEvent.MOUSE_MOVE, dragingElement, false, 0, true);
			canvas.parent.addEventListener(MouseEvent.MOUSE_DOWN, downCanvas);
			canvas.parent.addEventListener(MouseEvent.ROLL_OUT, outCanvas);
			canvas.parent.addEventListener(MouseEvent.ROLL_OVER, overCanvas);
			
		}
		
		/**
		 * 滑过编辑中的文字
		 * @param event
		 * 
		 */
		private function overEditText(e:ElementEvent):void
		{
			var ce:CanvasEvent = new CanvasEvent(CanvasEvent.OVER_EDIT_TEXT,true);
			ce.element = e.element;
			canvas.dispatchEvent(ce);
		}
		
		/**
		 * 离开编辑中的文字
		 * @param event
		 * 
		 */
		private function outEditText(e:ElementEvent):void
		{
			var ce:CanvasEvent = new CanvasEvent(CanvasEvent.OUT_EDIT_TEXT,true);
			ce.element = e.element;
			canvas.dispatchEvent(ce);
		}
		
		/**
		 * 滑过画布
		 * @param event
		 * 
		 */
		private function overCanvas(event:MouseEvent):void
		{
			canvas.dispatchEvent(new CanvasEvent(CanvasEvent.OVER_CANVAS,true));
		}
		
		/**
		 * 滑出画布
		 * @param event
		 * 
		 */
		private function outCanvas(event:MouseEvent):void
		{
			canvas.dispatchEvent(new CanvasEvent(CanvasEvent.OUT_CANVAS,true));
		}
		
		/**
		 * 改变画布背景颜色
		 * @param value
		 * 
		 */
		public function changeBGColor():void
		{
			canvas.dispatchEvent(new CanvasEvent(CanvasEvent.CHANGE_BG_COLOR));
		}
		
		/**
		 * 鼠标按下画布
		 * @param e
		 * 
		 */
		private function downCanvas(e:MouseEvent):void
		{
			canvas.dispatchEvent(new CanvasEvent(CanvasEvent.DOWN_CANVAS,true));
		}
		
		private function downElement(e:ElementEvent):void
		{
			var ce:CanvasEvent = new CanvasEvent(CanvasEvent.DOWN_ELEMENT,true);
			ce.element = e.element;
			canvas.dispatchEvent(ce);
		}
		
		/**
		 * 移动中元素处理
		 */
		private function dragingElement(e:ElementEvent):void
		{
			canvas.currentElement.dragingElement(canvas.preView);
		}
		
		/**
		 * 停止移动元素
		 */
		private function stopMoveElement(e:Event):void
		{
			canvas.removeEventListener(MouseEvent.MOUSE_UP, stopMoveElement);
			canvas.cleanPreView();
			canvas.currentElement.stopDragElement(canvas.preView);
			sendNotification(CommandNames.MOVE_ELEMENT, new Point(canvas.preView.x, canvas.preView.y));
			canvas.cleanPreViewPosition();
		}
		
		/**
		 * 移动元素
		 * @param e
		 * 
		 */
		public function startMoveElement():void
		{
			canvas.addEventListener(MouseEvent.MOUSE_UP, stopMoveElement, false, 0, true);
			canvas.cleanPreView();
			canvas.currentElement.startDragElement(canvas.preView);
		}
		
		/**
		 *键盘状态 
		 * 
		 */
		public function keyBoardState():void
		{
			currentKeyboardState =  defaultKeyboardState = new KeyboardDefaultSate(this);
			textKeyboardState = new KeyboardTextState(this);
		}
		
		/**
		 * 鼠标事件处理
		 * @param evt
		 * 
		 */
		private function mouseHandler(evt:MouseEvent):void
		{
			currentKeyboardState.mouseHandler(evt);
		}
		
		/**
		 *键盘按下事件处理 
		 * 
		 */
		private function keyDownBoardHandler(evt:KeyboardEvent):void
		{
			currentKeyboardState.keyDownBoardHandler(evt);
		}
		
		/**
		 *键盘弹起事件处理 
		 * 
		 */
		private function keyUpBoardHandler(evt:KeyboardEvent):void
		{
			currentKeyboardState.keyUpBoardHandler(evt);
		}
		
		/**
		 * 添加元素
		 */
		public function addElement(elements:ElementBase):void
		{
			canvas.addElement(elements);
			zoomCanvas.bound = canvas.bound;
		}
		
		/**
		 *更改键盘状态 
		 * @param evt
		 * 
		 */
		private function changeKeyboardState(evt:CanvasEvent):void
		{
			
			if (evt.type == CanvasEvent.TEXT_IS_EDIT_STATE)
			{
//				sendNotification(CommandNames.KEYBOARD_STATE_TEXT);
			}
			else if (evt.type == CanvasEvent.TEXT_NOT_EDIT_STATE)
			{
//				sendNotification(CommandNames.KEYBOARD_STATE_Default);
			}
		}
		
		/**
		 * 改变元素属性(改变的属性、改变的值)
		 * @param property
		 * @param obj
		 * 
		 */
		public function changeElementProperty(property:String, obj:Object, elements:ElementBase):void
		{
			elements.vo[property] = obj;
			elements.render();
		}
		
		/**
		 * 放大画布
		 */
		public function zoomIn(multiple:Number = 1.2):void
		{
			zoomCanvas.zoomIn(multiple);
			canvas.dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
			canvas.updateBound();
//			var _w:Number = canvas.stage.stageWidth;
//			var _h:Number = canvas.stage.stageHeight;
//			var _stage:Boolean = true;
//			var str:String  =  String(Math.floor(canvas.scale * 100))+ "%";
//			var arr:Array = [_w,_h,_stage,str];
//			mainUIMediator.sendNotification(CommandNames.SHOW_PROMPT, arr);
		}
		
		/**
		 * 缩小画布
		 */
		public function zoomOut(multiple:Number = 1.2):void
		{
			zoomCanvas.zoomOut(multiple);
			canvas.dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
			canvas.updateBound();
		}
		
		/**
		 * 自适应
		 */
		public function zoomAuto():void
		{
			zoomCanvas.zoomAuto();
			canvas.dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
		}
		
		/**
		 * 百分百
		 */
		public function hundredPercent():void
		{
			zoomCanvas.hundredPercent();
			canvas.dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
		}
		
		/**
		 * 开始移动画布
		 */
		public function startMoveCanvas():void
		{
			moveCanvas.startMoveScreen();
		}
		
		/**
		 * 停止移动画布
		 */
		public function stopMoveCanvas():void
		{
			moveCanvas.stopMoveCanvas();
		}
		
		
		/**
		 * 设置当前元素
		 */
		public function setCurrentElement(e:ElementEvent):void
		{
			if (canvas.currentElement)
				canvas.currentElement.toUnSelectedState();
			
			canvas.currentElement = e.element;
		}
		
		/**
		 * 获取当前元素
		 * @return 
		 * 
		 */
		public function getCurrentElement():ElementBase
		{
			return canvas.currentElement;
		}
		
		/**
		 * 清除所有元素
		 */
		public function clearAllShapes():void
		{
			canvas.clearElements();
			canvas.updateBound();
			zoomCanvas.bound = canvas.bound;
		}
		
		/**
		 * 删除当前元素
		 */
		public function deleteCurrentElement():void
		{
			canvas.currentElement.deleteSelf();
			canvas.currentElement = null;
			canvas.updateBound();
			zoomCanvas.bound = canvas.bound;
		}
		
		/**
		 * 重新渲染所有元素
		 */
		public function renderAllElement():void
		{
			var elementes:Vector.<ElementBase> = this.getAllShape();
			for each (var element:ElementBase in elementes)
			{
				element.render();
			}
		}
		
		/**
		 * 得到所有元素
		 */
		public function getAllShape():Vector.<ElementBase>
		{
			return canvas.allElement;
		}
		
		
		/**
		 * 画布
		 */		
		public function get canvas():Canvas
		{
			return this.viewComponent as Canvas;
		}
		
		
	}
}