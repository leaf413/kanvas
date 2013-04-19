package panels.toolBarModes
{
	import panels.ToolBarUI;
	
	import view.Element.ElementBase;
	
	/**
	 * 关系线模式
	 */	
	public class ConnectMode extends ToolBarModeBase
	{
		public function ConnectMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		/**
		 * 
		 */
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
//			toolBarMediator.editorUIMediator.editorUI.canvas.isWillConnector = true;
//			toolBarMediator.editorUIMediator.editorUI.canvas.isLineMode = false;
		}
		
		/**
		 */		
		override public function downCanvas(coreApp:CoreApp):void
		{
//			toolBarMediator.sendNotification(CommandNames.PROPERTY_TO_STAGE_STATE);
		}
		
		/**
		 */		
//		override public function unSelect(editorProxy:EditorFieldProxy):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DIS_CONNECT_SHAPE);
//		}
		
		/**
		 */		
//		override public function connectorSelected(connector:ConnectorUI):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DIS_CONNECT_SHAPE);
//		}
		
		/**
		 */		
//		override public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DIS_CONNECT_SHAPE);
//		}
		
		/**
		 * 在连线状态下不能连群组
		 */		
//		override public function groupSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.DIS_CONNECT_SHAPE);
//		}
		
		/**
		 */		
//		override public function preSelect(value:Object) : void
//		{
//			toolBarMediator.sendNotification(CommandNames.CONNECT_SHAPE, value);
//		}
	}
}