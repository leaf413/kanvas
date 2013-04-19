package controller.event
{
	import flash.events.Event;
	
	import view.Element.ElementBase;
	
	/**
	 * 画布事件
	 * @author foxm
	 * 
	 */
	public class CanvasEvent extends Event
	{
		/**
		 * 鼠标按下画布
		 */
		public static const DOWN_CANVAS:String = "downCanvas";
		
		/**
		 * 滑过画布
		 */
		public static const OUT_CANVAS:String = "outCanvas";
		
		/**
		 * 滑出画布
		 */
		public static const OVER_CANVAS:String = "overCanvas";
		
		/**
		 * 鼠标按下元素
		 */
		public static const DOWN_ELEMENT:String = "downElement";
		
		/**
		 * 鼠标经过编辑中的文字
		 */
		public static const OVER_EDIT_TEXT:String = "overEditTextforCanvas";
		
		/**
		 * 鼠标离开编辑中的文字
		 */
		public static const OUT_EDIT_TEXT:String = "outEditTextforCanvas";
		
		/**
		 * 文字正在编辑状态
		 */
		public static const TEXT_IS_EDIT_STATE:String = "textIsEditState";
		
		/**
		 * 文字返回默认状态
		 */
		public static const TEXT_NOT_EDIT_STATE:String = "textNotEditState";
		
		/**
		 * 改变背景颜色
		 */
		public static const CHANGE_BG_COLOR:String = "changeBGColor";
		
		/**
		 * 当前元素
		 */
//		public static const CURRENT_ELEMENT:String = "currentElement";
		
		/**
		 * 元素
		 */
		public var element:ElementBase;
		
		public function CanvasEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}