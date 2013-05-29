package ui
{
	import com.landray.kPlayer.assets.ImportBtn;
	import com.landray.kPlayer.assets.ImportBtn_down;
	import com.landray.kPlayer.assets.ImportBtn_over;
	import com.landray.kPlayer.assets.ScreenDefault;
	import com.landray.kPlayer.assets.ScreenDefault_Down;
	import com.landray.kPlayer.assets.ScreenDefault_Over;
	import com.landray.kPlayer.assets.ScreenFull;
	import com.landray.kPlayer.assets.ScreenFull_Down;
	import com.landray.kPlayer.assets.ScreenFull_Over;
	import com.landray.kPlayer.assets.Toolbar;
	import com.landray.kPlayer.assets.ToolbarBitmap;
	import com.landray.kPlayer.assets.ZoomAuto;
	import com.landray.kPlayer.assets.ZoomAuto_Down;
	import com.landray.kPlayer.assets.ZoomAuto_Over;
	import com.landray.kPlayer.assets.ZoomDefault;
	import com.landray.kPlayer.assets.ZoomDefault_Down;
	import com.landray.kPlayer.assets.ZoomDefault_Over;
	import com.landray.kPlayer.assets.ZoomIn;
	import com.landray.kPlayer.assets.ZoomIn_Down;
	import com.landray.kPlayer.assets.ZoomIn_over;
	import com.landray.kPlayer.assets.ZoomOut;
	import com.landray.kPlayer.assets.ZoomOut_Down;
	import com.landray.kPlayer.assets.ZoomOut_over;
	
	import event.ToolBarEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import util.ToolTipTypes;
	import util.layout.BitmapScale9Grid;
	
	public class ToolBarUI extends Sprite
	{
		private var view:Toolbar;
		
		private var viewWidth:Number;
		
		private var viewHeight:Number;
		
		private var bitmapScale9Grid:BitmapScale9Grid;
		
		public function ToolBarUI(w:Number, h:Number)
		{
			super();
			viewWidth = w;
			viewHeight = h;
			init();
		}
		
		private function init():void
		{
			initView();
			initList();
		}
		
		private function initList():void
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, downHandler,false, 0, true);
			importButton.addEventListener(MouseEvent.CLICK, importHandler, false, 0, true);
//			zoomInButton.addEventListener(MouseEvent.CLICK, zoomInHandler, false, 0, true);
//			zoomOutButton.addEventListener(MouseEvent.CLICK, zoomOutHandler, false, 0, true);
			zoomDefaultButton.addEventListener(MouseEvent.CLICK, zoomDefaultHandler, false, 0, true);
			zoomAutoButton.addEventListener(MouseEvent.CLICK, zoomAutoHandler, false, 0, true);
			screenDefaultButton.addEventListener(MouseEvent.CLICK, screenDefaultHandler, false, 0, true);
			screenFullButton.addEventListener(MouseEvent.CLICK, screenFullHandler, false, 0, true);
			
			importButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
			importButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
//			zoomInButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
//			zoomInButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
//			zoomOutButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
//			zoomOutButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
			zoomDefaultButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
			zoomDefaultButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
			zoomAutoButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
			zoomAutoButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
			screenDefaultButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
			screenDefaultButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
			screenFullButton.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler, false, 0, true);
			screenFullButton.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler, false, 0, true);
		}
		
		
		private function initView():void
		{
			view = new Toolbar();
			var bitmapData:BitmapData = new BitmapData((view as Sprite).width,(view as Sprite).height);
			bitmapData.draw(view)
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmapScale9Grid = new BitmapScale9Grid(bitmap,32,40,27,170);
			addChild(bitmapScale9Grid);
			
			importButton = new SimpleButton(new ImportBtn, new ImportBtn_over, new ImportBtn_down, new ImportBtn_down);
//			zoomInButton = new SimpleButton(new ZoomIn, new ZoomIn_over, new ZoomIn_Down, new ZoomIn_Down);
//			zoomOutButton = new SimpleButton(new ZoomOut, new ZoomOut_over, new ZoomOut_Down, new ZoomOut_Down);
			zoomDefaultButton = new SimpleButton(new ZoomDefault, new ZoomDefault_Over, new ZoomDefault_Down, new ZoomDefault_Down);
			zoomAutoButton = new SimpleButton(new ZoomAuto, new ZoomAuto_Over, new ZoomAuto_Down, new ZoomAuto_Down);
			screenDefaultButton = new SimpleButton(new ScreenDefault, new ScreenDefault_Over, new ScreenDefault_Down, new ScreenDefault_Down);
			screenFullButton = new SimpleButton(new ScreenFull, new ScreenFull_Over, new ScreenFull_Down, new ScreenFull_Down);
			
			addChild(importButton);
//			addChild(zoomInButton);
//			addChild(zoomOutButton);
			addChild(zoomDefaultButton);
			addChild(zoomAutoButton);
			addChild(screenDefaultButton);
			addChild(screenFullButton);
			
			bitmapScale9Grid.width = viewWidth;
			
			importButton.x = 25;
			importButton.y = 21;
			
//			zoomInButton.x = 62;
//			zoomInButton.y = 18;
//			
//			zoomOutButton.x = 99;
//			zoomOutButton.y = 18;
			
			zoomDefaultButton.x = zoomAutoButton.x = 136;
			zoomDefaultButton.y = zoomAutoButton.y = 18;
			zoomDefaultButton.visible = false;
			
			screenDefaultButton.x = screenFullButton.x = 173;
			screenDefaultButton.y = screenFullButton.y = 18;
			screenDefaultButton.visible = false;
			
			
			
			
			this.y = viewHeight - this.height  + 20;
		}
		
		/**
		 * 更新布局
		 */
		public function updateLayout():void
		{
			bitmapScale9Grid.width = this.stage.stageWidth;
			this.y = this.stage.stageHeight - this.height  + 20;
		}
		
		private function downHandler(e:MouseEvent):void
		{
			e.stopPropagation();
		}
		
		private function showToolTip(target:String):void
		{
			dispatchEvent(new ToolBarEvent(ToolBarEvent.TOOLTIP_SHOW, target));
		}
		
		/**
		 * 鼠标移出
		 */
		private function mouseOutHandler(evt:MouseEvent):void
		{
			dispatchEvent(new ToolBarEvent(ToolBarEvent.TOOLTIP_HIDE));
			(evt.currentTarget as SimpleButton).removeEventListener(MouseEvent.MOUSE_MOVE, upDataToolTipPosition);
		}
		
		/**
		 * 鼠标在按钮上划过
		 */
		private function upDataToolTipPosition(evt:MouseEvent):void
		{
			dispatchEvent(new ToolBarEvent(ToolBarEvent.TOOLTIP_UPDATAPOSITION));
		}
		
		/**
		 * 鼠标划入按钮
		 */
		private function mouseOverHandler(evt:MouseEvent):void
		{
			switch(evt.currentTarget)
			{
				case importButton:
					showToolTip(ToolTipTypes.IMPORT);
					break;
//				case zoomInButton:
//					showToolTip(ToolTipTypes.ZOOM_IN);
//					break;
//				case zoomOutButton:
//					showToolTip(ToolTipTypes.ZOOM_OUT);
//					break;
				case zoomDefaultButton:
					showToolTip(ToolTipTypes.ZOOM_DEFAULT);
					break;
				case zoomAutoButton:
					showToolTip(ToolTipTypes.ZOOM_AUTO);
					break;
				case screenDefaultButton:
					showToolTip(ToolTipTypes.SCREEN_DEFAULT);
					break;
				case screenFullButton:
					showToolTip(ToolTipTypes.SCREEN_FULL);
					break;
			}
			(evt.currentTarget as SimpleButton).addEventListener(MouseEvent.MOUSE_MOVE, upDataToolTipPosition,false,0,true);
		}
		
		private function importHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.IMPORT_FILE));
		}
		
		
		/**
		 * 点击退出全屏按钮
		 */
		private function screenDefaultHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_SCREEN_DEFAULT_BTN));
		}
		
		/**
		 * 点击全屏按钮
		 */
		private function screenFullHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_SCREEN_FULL_BTN));
		}
		
		/**
		 * 点击舞台自适应按钮
		 */
		private function zoomAutoHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_ZOOM_AUTO_BTN));
		}
		
		/**
		 * 点击舞台1比1按钮
		 */
		private function zoomDefaultHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_ZOOM_DEFAULT_BTN));
		}
		
		/**
		 * 点击放大按钮
		 */
		private function zoomInHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_ZOOM_IN_BTN));
		}
		
		/**
		 * 点击缩小按钮
		 */
		private function zoomOutHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new ToolBarEvent(ToolBarEvent.CLICK_ZOOM_OUT_BTN));
		}
		
		/**
		 * 导入按钮
		 */
		private var importButton:SimpleButton;
		
		/**
		 * 放大按钮
		 */
//		private var zoomInButton:SimpleButton;
		
		/**
		 * 缩小按钮
		 */
//		private var zoomOutButton:SimpleButton;
		
		/**
		 * 1:1按钮
		 */
		public var zoomDefaultButton:SimpleButton;
		
		/**
		 * 自适应按钮
		 */
		public var zoomAutoButton:SimpleButton;
		
		/**
		 * 退出全屏按钮
		 */
		public var screenDefaultButton:SimpleButton;
		
		/**
		 * 全屏按钮
		 */
		public var screenFullButton:SimpleButton;
		
	}
}