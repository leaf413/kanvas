package events
{
	import flash.events.Event;
	
	public class ExportPanelEvent extends Event
	{
		
		public static const EXPORT_FILE:String = "ExportFile";
		public static const SAVE_IMAGE:String = "SaveImage";
		
		public function ExportPanelEvent(type:String)
		{
			super(type);
		}
	}
}