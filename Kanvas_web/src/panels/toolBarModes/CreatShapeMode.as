package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	
	import view.Canvas;
	import view.Element.ElementBase;
	
	public class CreatShapeMode extends ToolBarModeBase
	{
		public function CreatShapeMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
//			coreApp.canvasController.drawBrokenFame();
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.canvasController.drawBrokenFame();
		}
		
//		override public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DRAW_SHAPE_SIZE);
//		}
		
		override public function showPanel():void
		{
			super.showPanel();
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.SHOW_SHAPE_PANEL));
		}
		
		override public function hidePanel():void
		{
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.HIDE_SHAPE_PANEL));
		}
		
//		override public function preSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DRAW_SHAPE_SIZE);
//		}
		
		override public function toSelectMode():void
		{
			super.toSelectMode();
		}
	}
}