package events
{
	import flash.events.Event;
	
	public class InsertPanelEvent extends Event
	{
		
		public static const IMPORT_FILE:String = "importFile";
		public static const INSERT_IMAGE:String = "insertImage";
		public static const NEW_FILE:String = "NewFile";
		public static const IMPORT_MODEL:String = "importModel";
		
		public function InsertPanelEvent(type:String)
		{
			super(type);
		}
	}
}