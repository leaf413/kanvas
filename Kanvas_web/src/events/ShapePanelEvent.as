package events
{
	import flash.events.Event;
	
	
	public class ShapePanelEvent extends Event
	{
		public static const CREAT_CUSTOMSHAPE:String = "doubleCreatCustomShape";
		public static const DRAW_SHAPE_SIZE:String = "drawShapeSize";
		
		public function ShapePanelEvent(type:String)
		{
			super(type);
		}
		
	}
}