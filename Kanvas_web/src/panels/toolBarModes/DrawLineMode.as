package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	
	import view.Element.ElementBase;
	
	public class DrawLineMode extends ToolBarModeBase
	{
		public function DrawLineMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		/**
		 * 
		 */
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
//			toolBarMediator.editorUIMediator.editorUI.canvas.isWillConnector = false;
//			toolBarMediator.editorUIMediator.editorUI.canvas.isLineMode = true;
		}
		
//		/**
//		 */		
//		override public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
//			toolBarMediator.sendNotification(CommandNames.CREATE_LINE);
//		}
		
		/**
		 */		
		override public function downCanvas(coreApp:CoreApp):void
		{
			//这里开始画线
			coreApp.canvasController.drawBrokenFame();
		}
		
//		/**
//		 */		
//		override public function preSelect(value:Object):void
//		{
//			//这里开始画线
//			toolBarMediator.sendNotification(CommandNames.CREATE_LINE);
//		}
	}
}