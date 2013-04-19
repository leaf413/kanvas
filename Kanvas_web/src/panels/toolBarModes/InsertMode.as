package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	
	
	public class InsertMode extends ToolBarModeBase
	{
		public function InsertMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			toolBarUI.currentMode.toSelectMode();
		}
		
		override public function showPanel():void
		{
			super.showPanel();
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.SHOW_INSERT_PANEL));
		}
		
		override public function hidePanel():void
		{
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.HIDE_INSERT_PANEL));
		}
		
		override public function toSelectMode():void
		{
			super.toSelectMode();
		}
	}
}