package panels.toolBarModes
{
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import view.Element.ElementBase;

	public class MoveScreenMode extends ToolBarModeBase
	{
		public function MoveScreenMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		/**
		 */		
		override public function toMoveScreenMode():void
		{
			
		}
		
		override public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.toSelectedMode();
		}
		
		override public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			super.overCanvas(toolTipLayer);
			toolTipLayer.toMoveScreenMode();
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			coreApp.canvasController.startMoveCanvas();
		}
		
		/**
		 * 这里不是画框是移动屏幕
		 */		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.canvasController.startMoveCanvas();
		}
		
		override public function toShapeMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toShapeMode();
		}
		
		override public function toLineMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toLineMode();
		}
		
		override public function toInsertMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toInsertMode();
		}
		
		override public function toExportMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toExportMode();
		}
		
		override public function toZoomInMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toZoomInMode();
		}
		
		override public function toZoomOutMode():void
		{
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
			super.toZoomOutMode();
		}
		
		override public function toSelectMode():void
		{
			super.toSelectMode();
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
		}
		
		override public function toTextMode():void
		{
			super.toTextMode();
//			toolBarMediator.sendNotification(CommandNames.STOP_MOVE_SCREEN);
		}
		
	}
}