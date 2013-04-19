package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	
	public class ExportMode extends ToolBarModeBase
	{
		public function ExportMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			toolBarUI.currentMode.toSelectMode();
//			toolBarMediator.sendNotification(CommandNames.PROPERTY_TO_STAGE_STATE);
		}
		
		override public function showPanel():void
		{
			super.showPanel();
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.SHOW_EXPORT_PANEL));
		}
		
		override public function hidePanel():void
		{
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.HIDE_EXPORT_PANEL));
		}
		
		override public function toSelectMode():void
		{
			super.toSelectMode();
		}
	}
}