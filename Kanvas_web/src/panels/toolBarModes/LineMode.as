package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import view.Element.ElementBase;

	/**
	 * 线条系模式
	 * @author foxm
	 * 
	 */
	public class LineMode extends ToolBarModeBase
	{
		public function LineMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.toSelectedMode();
		}
		
		override public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			super.overCanvas(toolTipLayer);
			toolTipLayer.toConnectorMode();
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.canvasController.drawLine();
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			coreApp.canvasController.drawLine();
		}
		
		override public function showPanel():void
		{
			super.showPanel();
			this.toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.SHOW_CONNECTOR_PANEL));
		}
		
		override public function hidePanel():void
		{
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.HIDE_CONNECTOR_PANEL));
		}
		
		
	}
}