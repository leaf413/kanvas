package events
{
	import flash.events.Event;
	
	public class ConnectorPanelEvent extends Event
	{
		
		public static const LINE:String = "line";
		public static const CONNECT:String = "connect";
		public static const CREATE_LINE:String = "createLine";
		
		public function ConnectorPanelEvent(type:String)
		{
			super(type);
		}
	}
}