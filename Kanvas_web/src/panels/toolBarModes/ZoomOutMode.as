package panels.toolBarModes
{
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import view.Element.ElementBase;
	
	public class ZoomOutMode extends ToolBarModeBase
	{
		public function ZoomOutMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			coreApp.canvas.mouseEnabled = false;
			coreApp.canvasController.zoomOut();
		}
		
		override public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.toSelectedMode();
		}
		
		override public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			super.overCanvas(toolTipLayer);
			toolTipLayer.toZoomOutMode();
		}
		
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.canvas.mouseEnabled = false;
			coreApp.canvasController.zoomOut();
		}
		
		override public function toShapeMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toShapeMode();
		}
		
		override public function toLineMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toLineMode();
		}
		
		override public function toInsertMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toInsertMode();
		}
		
		override public function toExportMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toExportMode();
		}
		
		/**
		 */		
		override public function toZoomInMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toZoomInMode();
		}
		
		
		override public function toZoomOutMode():void
		{
			
		}
		
		override public function toMoveScreenMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toMoveScreenMode();
		}
		
		override public function toSelectMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toSelectMode();
		}
		
		override public function toTextMode():void
		{
//			toolBarMediator.7(CommandNames.STOP_ZOOM_OUT);
			super.toTextMode();
		}
		
		override public function toConnectMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_OUT);
			super.toConnectMode();
		}
	}
}