package events
{
	import flash.events.Event;
	
	public class ShapeMapperEvent extends Event
	{
		
		static public const BORDER_SELECT:String = 'BorderSelect';
		
		static public const BG_SELECT:String = 'BgSelect';
		
		static public const SELECT_NONE:String = 'SelectNone';
		
		static public const CHANGE_LOCK:String = 'changeLock';
		
		static public const CHANGE_XY_MAPPER:String = 'changeXYMapper';
		
		static public const CHANGE_WH_MAPPER:String = "changeWHMaooer";
		
		static public const CHANGE_COLOR:String = "changeColor";
		
		static public const CHANGE_ARROW_MAPPER:String = "changeArrowMapper";
		
		static public const LOCK_MAPPER:String = 'lockMapper';
		
		public function ShapeMapperEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}