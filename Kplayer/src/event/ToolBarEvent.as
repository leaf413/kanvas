package event
{
	import flash.events.Event;
	
	/**
	 * 工具栏事件
	 * @author foxm
	 * 
	 */
	public class ToolBarEvent extends Event
	{
		public static const CLICK_ZOOM_IN_BTN:String = "clickZoomInBtn";
		public static const CLICK_ZOOM_OUT_BTN:String = "clickZoomOutBtn";
		public static const CLICK_ZOOM_DEFAULT_BTN:String = "clickZoomDefaultBtn";
		public static const CLICK_ZOOM_AUTO_BTN:String = "clickZoomAutoBtn";
		public static const CLICK_SCREEN_DEFAULT_BTN:String = "clickScreenDefaultBtn";
		public static const CLICK_SCREEN_FULL_BTN:String = "clickScreenFullBtn";
		
		public static const TOOLTIP_SHOW:String = "toolTipShow";
		public static const TOOLTIP_HIDE:String = "toolTipHide";
		public static const TOOLTIP_UPDATAPOSITION:String = "upDataPosition";
		
		public static const ZOOM_AUTO:String = "zoomAuto";
		
		public static const IMPORT_FILE:String = "importFile";
		
		public function ToolBarEvent(type:String, toolTipTypes:String = null)
		{
			super(type, true);
			this.toolTipTypes = toolTipTypes;
		}
		
		public var toolTipTypes:String;
	}
}