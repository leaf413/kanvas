package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import view.Element.ElementBase;
	

	/**
	 */	
	public class ToolBarModeBase
	{
		/**
		 */		
		public function downCanvas(coreApp:CoreApp):void
		{
		}
		
		public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.showMouseIcon();
		}
		
		public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			
		}
		
		/**
		 * 
		 */
		public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
		}
		
		/**
		 */		
		public function ToolBarModeBase(toolBar:ToolBarUI)
		{
			this.toolBarUI = toolBar;
		}
		
		/**
		 * 	Default is shape select.
		 *  Or create text or disConnect.
		 */		
//		public function connectorSelected(connector:ConnectorUI):void
//		{
//			toolBarMediator.sendNotification(CommandNames.SELECT_SHAPE, connector);
//		}
		
		/**
		 *  Start moving for selected text except for text mode.
		 */		
//		public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
//			textShapeVO.dispatchEvent(new TextUIEvent(TextUIEvent.TEXT_START_MOVE));
//		}
		
		/**
		 *  Default is shape select.
		 */		
//		public function preSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.SELECT_SHAPE, value);
//		}
		
		/**
		 *群组选项功能 
		 * @param value
		 * 
		 */
//		public function groupSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.SELECT_SHAPE, value);
//		}
		
		/**
		 *  When in scaled mode, set shape to scaled state after selected it.
		 */		
		public function shapeSelected():void
		{
			
		}
//		
//		/**
//		 */		
//		public function unSelect(editorProxy:EditorFieldProxy):void
//		{
//			toolBarMediator.sendNotification(CommandNames.UN_SELECT_SHAPE);
//		}
		
		public function showPanel():void
		{
			toolBarUI.dispatchEvent(new ToolBarEvent(ToolBarEvent.HIDE_PROPERTY_PANEL));
			toolBarUI.propertyBtn.selected = false;
		}
		
		public function hidePanel():void
		{
			
		}
		
		
		
		
		//***********************************************************
		//
		// 面板状态切换
		//
		//***********************************************************
		public function toInsertMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toInsertMode();
			toolBarUI.currentMode = toolBarUI.insertMode;
			toolBarUI.currentMode.showPanel();
		}
		
		public function toShapeMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toShapeMode();
			toolBarUI.currentMode = toolBarUI.shapeMode;
			toolBarUI.currentMode.showPanel();
		}
		
		public function toLineMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toLineMode();
			toolBarUI.currentMode = toolBarUI.lineMode;
			toolBarUI.currentMode.showPanel();
		}
		
		public function toExportMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toExportMode();
			toolBarUI.currentMode = toolBarUI.exportMode;
			toolBarUI.currentMode.showPanel();
		}
		
		//***********************************************************
		//
		// 操作状态切换
		//
		//***********************************************************
		
		/**
		 * ToolBar mode to selected.
		 * Tip layer to selected icon.
		 */		
		public function toSelectMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toSelectedMode();
			toolBarUI.currentMode = toolBarUI.selectMode;
		}
		

		
		public function toTextMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toTextMode();
			toolBarUI.currentMode = toolBarUI.textMode;
		}
		
		public function toConnectMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toLineMode();
			toolBarUI.currentMode = toolBarUI.connectMode;
		}
		
		public function toDrawlineMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toLineMode();
			toolBarUI.currentMode = toolBarUI.drawLineMode;
		}
		
		public function toMoveScreenMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toMoveScreenMode();
			toolBarUI.currentMode = toolBarUI.moveScreenMode;
		}
		
		public function toZoomInMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toZoomInMode();
			toolBarUI.currentMode = toolBarUI.zoomInMode;
		}
		
		public function toZoomOutMode():void
		{
			toolBarUI.currentMode.hidePanel();
			toolBarUI.toZoomOutMode();
			toolBarUI.currentMode = toolBarUI.zoomOutMode;
		}
		
		
		/**
		 */		
		protected var toolBarUI:ToolBarUI;
	}
}