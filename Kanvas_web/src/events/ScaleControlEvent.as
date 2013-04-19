package events
{
	import flash.events.Event;
	
	public class ScaleControlEvent extends Event
	{
		
		public static const SHOW_SCALE_CONTROL_ICON:String = "showControlIcon";
		public static const RETURN_TO_SCALE_ICON:String = "returnToScaleIcon";
		
		public static const SHOW_SIZE_PROMPT:String = "showSizePrompt";
		public static const SHOW_ROTATION_PROMPT:String = "showRotationPrompt";
		public static const SHOW_POSITION_PROMPT:String = "showPositionPrompt";
		public static const HIDE_PROMPT:String = "hidePrompt";
		
		public static const SCALE_COMPLETE:String = "scaleComplete";
		public static const SCLAE_LINE_COMPLETE:String = "scaleLineComplete";
		
		/**
		 */		
		public function ScaleControlEvent(type:String, controlType:String = null)
		{
			super(type,true);
			this.controlType = controlType;
		}
		
		public var _x:Number = 0;
		
		public var _y:Number = 0;
		
		public var _w:Number = 0;
		
		public var _h:Number = 0;
		
		public var _r:Number = 0;
		
		/**
		 */		
		public var controlType:String;
	}
}