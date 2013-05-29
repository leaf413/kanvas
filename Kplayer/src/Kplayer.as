package
{
	import com.landray.kPlayer.assets.MouseHand;
	
	import event.ToolBarEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	import ui.KPlayToolTip;
	import ui.ToolBarUI;
	
	import util.StageUtil;
	
	public class Kplayer extends Sprite
	{
		private var coreApp:CoreApp;
		
		private var toolBarUI:ToolBarUI;
		
		public var toolTip:KPlayToolTip;
		
		public var mouseHand:MouseHand;
		
//		private var startMovePoint:Point = new Point();
		
		public function Kplayer()
		{
			super();
			StageUtil.initApplication(this, initStage);
		}
		
		private function initStage():void
		{
			if (stage.stageWidth == 0)
			{
				stage.addEventListener(Event.RESIZE, stageReSized, false, 0, true);
				stage.dispatchEvent(new Event(Event.RESIZE));
			}
			else
			{
				init();
			}
		}
		
		/**
		 * 解决IE下Flash初始化舞台尺寸无法获取的问题。
		 */		
		private function stageReSized(evt:Event):void
		{
			if (stage.stageWidth > 0)
			{
				stage.removeEventListener(Event.RESIZE, stageReSized);
				init();
			}
		}
		
		/**
		 * 初始化
		 */
		private function init():void
		{
			coreApp = new CoreApp();
//			coreApp.canvas.renderBG(stage.stageWidth, stage.stageHeight);
			this.addChild(coreApp);
			coreApp.renderBG();
			
			initView();
			initListen();
			
			stage.addEventListener(Event.RESIZE, updateSize, false, 0, true);
			stage.addEventListener(Event.FULLSCREEN, fullScreenHandler, false, 0, true);
			
			coreApp.canvasController.startMoveCanvas();
		}
		
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function updateSize(event:Event):void
		{
			coreApp.renderBG();
			toolBarUI.updateLayout();
		}
		
		/**
		 * 初始化界面
		 */
		private function initView():void
		{
			toolBarUI = new ToolBarUI(stage.stageWidth , stage.stageHeight);
			addChild(toolBarUI);
			toolTip = new KPlayToolTip();
			mouseHand = new MouseHand();
			addChild(mouseHand);
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, startMoveHandler, false, 0, true);
			this.addEventListener(MouseEvent.ROLL_OUT, outHandler, false, 0, true);
			this.addEventListener(MouseEvent.ROLL_OVER, overHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, mouseHandler, false, 0, true);
		}
		
		private function initListen():void
		{
			toolBarUI.addEventListener(ToolBarEvent.CLICK_SCREEN_DEFAULT_BTN, toolbarHandler, false, 0, true);
			toolBarUI.addEventListener(ToolBarEvent.CLICK_SCREEN_FULL_BTN, toolbarHandler, false, 0, true);
			toolBarUI.addEventListener(ToolBarEvent.CLICK_ZOOM_AUTO_BTN, toolbarHandler, false, 0, true);
			toolBarUI.addEventListener(ToolBarEvent.CLICK_ZOOM_DEFAULT_BTN, toolbarHandler, false, 0, true);
		}
		
		public function mouseHandler(evt:MouseEvent):void
		{
			if (evt.delta>0)
			{
				coreApp.canvasController.zoomIn();
			}
			else
			{
				coreApp.canvasController.zoomOut();
			}
		}
		
		protected function toolbarHandler(evt:Event):void
		{
			switch(evt.type)
			{
				case ToolBarEvent.CLICK_SCREEN_DEFAULT_BTN:
					toolBarUI.screenDefaultButton.visible = false;
					toolBarUI.screenFullButton.visible = true;
					stage.displayState = StageDisplayState.NORMAL;
					
					break;
				case ToolBarEvent.CLICK_SCREEN_FULL_BTN:
					toolBarUI.screenDefaultButton.visible = true;
					toolBarUI.screenFullButton.visible = false;
					stage.displayState = StageDisplayState.FULL_SCREEN;
					break;
				case ToolBarEvent.CLICK_ZOOM_AUTO_BTN:
					coreApp.canvasController.zoomAuto();
					toolBarUI.zoomAutoButton.visible = false;
					toolBarUI.zoomDefaultButton.visible = true;
					break;
				case ToolBarEvent.CLICK_ZOOM_DEFAULT_BTN:
					coreApp.canvasController.hundrerPercent();
					toolBarUI.zoomAutoButton.visible = true;
					toolBarUI.zoomDefaultButton.visible = false;
					break;
			}
		}
		
		private function shapeDownHandle():void
		{
			if (stage.displayState == "normal")
			{
				toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_SCREEN_DEFAULT_BTN));
			}
			
			ExternalInterface.call("downShape",'e.shapeUI.shapeVO.id');
		}
		
		private function outHandler(evt:MouseEvent):void
		{
			toolBarUI.visible = false;
		}
		
		private function overHandler(evt:MouseEvent):void
		{
			toolBarUI.visible = true;
		}
		
		private function startMoveHandler(evt:MouseEvent):void
		{
//			updateStartPoint();
			this.stage.addEventListener(MouseEvent.MOUSE_UP, stopMoveHandler);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler, false, 0, true);
			Mouse.hide();
			mouseHand.visible = true;
			mouseHand.x = this.stage.mouseX;
			mouseHand.y = this.stage.mouseY;
		}
		
//		private function updateStartPoint():void
//		{
//			startMovePoint.x = this.stage.mouseX;
//			startMovePoint.y = this.stage.mouseY;
//		}
		
		
		/**
		 */		
		private function stopMoveHandler(evt:MouseEvent):void
		{
			mouseHand.visible = false;
			Mouse.show();
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, stopMoveHandler);
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
		}
		
		/**
		 */		
		private function moveHandler(evt:MouseEvent):void
		{
//			var disX:Number = this.stage.mouseX - startMovePoint.x;
//			var disY:Number = this.stage.mouseY - startMovePoint.y;
			
			mouseHand.x = this.stage.mouseX;
			mouseHand.y = this.stage.mouseY;
			
//			canvasUI.x += disX;
//			canvasUI.y += disY;
			
//			updateStartPoint();
		}
		
		/**
		 * 全屏
		 * @param e
		 * 
		 */
		private function fullScreenHandler(e:Event):void
		{
			if (stage.displayState == "normal")
			{
				toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_SCREEN_DEFAULT_BTN));
			}
			else
			{
			}
		}
	}
}