package panels.toolBarModes
{
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import view.Element.ElementBase;
	
	public class ZoomInMode extends ToolBarModeBase
	{
		public function ZoomInMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.canvasController.zoomIn();
		}
		
		override public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.toSelectedMode();
		}
		
		override public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			super.overCanvas(toolTipLayer);
			toolTipLayer.toZoomInMode();
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			coreApp.canvasController.zoomIn();
		}
		
		/**
		 */		
		override public function toZoomInMode():void
		{
		}
		
		override public function toShapeMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toShapeMode();
		}
		
		override public function toLineMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toLineMode();
		}
		
		override public function toInsertMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toInsertMode();
		}
		
		override public function toExportMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toExportMode();
		}
		
		override public function toMoveScreenMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toMoveScreenMode();
		}
		
		override public function toSelectMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toSelectMode();
		}
		
		override public function toTextMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toTextMode();
		}
		
		override public function toConnectMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toConnectMode();
		}
		
		override public function toZoomOutMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_ZOOM_IN);
			super.toZoomOutMode();
		}
	}
}