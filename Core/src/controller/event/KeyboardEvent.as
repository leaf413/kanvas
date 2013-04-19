package controller.event
{
	import flash.events.Event;
	
	/**
	 * 键盘事件
	 * @author foxm
	 * 
	 */
	public class KeyboardEvent extends Event
	{
		/**
		 * 按下空格键
		 */
		public static const KEYBOARD_DOWN_SPACE:String = "keyboardDownSpace";
		
		/**
		 * 松开空格键
		 */
		public static const KEYBOARD_UP_SPACE:String = "keyboardUpSpace";
		
		public function KeyboardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}