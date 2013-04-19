package events
{
	import flash.events.Event;
	
	public class ToolBarEvent extends Event
	{
		public static const TO_INSERT_MODE:String = "toInsertMode";
		public static const TO_SELECTED_MODE:String = "toSelectedMode";
		public static const TO_SHAPE_MODE:String = "toShapeMode";
		public static const TO_TEXT_MODE:String = "toTextMode";
		public static const TO_LINE_MODE:String = "toLineMode";
		public static const TO_CONNECT_MODE:String = "toConnectMode";
		public static const TO_DRWA_LINE_MODE:String = "toDrwaLineMode";
		public static const TO_MOVE_SCREEN_MODE:String = "toMoveScreenMode";
		public static const TO_ZOOM_IN_MODE:String = "toZoomInMode";
		public static const TO_ZOOM_OUT_MODE:String = "toZoomOutMode";
		public static const TO_EXPORT_MODE:String = "toExportMode";
		
		public static const PERCENT_CANVAS:String = "percentCanvas";
		public static const ONE_PERCENT_CANVAS:String = "onePercentCanvas";
		
		public static const SHOW_INSERT_PANEL:String = "showInsertPanel";
		public static const SHOW_SHAPE_PANEL:String = "showShapePanel";
		public static const SHOW_CONNECTOR_PANEL:String = "showConnectorPanel";
		public static const SHOW_EXPORT_PANEL:String = "showExportPanel";
		public static const SHOW_PROPERTY_PANEL:String = "showPorpertyPanel";
		
		public static const HIDE_INSERT_PANEL:String = "hideInsertPanel";
		public static const HIDE_SHAPE_PANEL:String = "hideShapePanel";
		public static const HIDE_CONNECTOR_PANEL:String = "hideConnectorPanel";
		public static const HIDE_EXPORT_PANEL:String = "hideExportPanel";
		public static const HIDE_PROPERTY_PANEL:String = "hidePropertyPanel";
		
		public static const CLICK_PROPERTY_BTN:String = "clickPropertyBtn";
		
		public static const CLICK_RETURN_BTN:String = "clickReturnBtn";
		
		public static const CLICK_NEXT_BTN:String = "clickNextBtn";
		
		/**
		 */		
		public function ToolBarEvent(type:String)
		{
			super(type, true);
		}
	}
}