package controller.event
{
	import flash.events.Event;
	
	import view.Element.ElementBase;
	
	/**
	 * 元素事件
	 * @author foxm
	 * 
	 */
	public class ElementEvent extends Event
	{
		/**
		 * 鼠标按下元素
		 */
		public static const MOUSE_DOWN:String = "mouseDownElement";
		
		/**
		 * 鼠标松开元素
		 */
		public static const MOUSE_UP:String = "mouseUpElement";
		
		/**
		 * 鼠标在元素上移动
		 */
		public static const MOUSE_MOVE:String = "mouseMoveElement";
		
		/**
		 * 鼠标经过编辑中的文字
		 */
		public static const MOUSE_OVER_EDIT_TEXT:String = "mouseOverEditTextElement";
		
		/**
		 * 鼠标离开编辑中的文字
		 */
		public static const MOUSE_OUT_EDIT_TEXT:String = "mouseOutEditTextElement";
		
		/**
		 * 鼠标离开元素
		 */
		public static const MOUSE_OUT:String = "mouseOutElement";
		
		/**
		 * 当前选中元素
		 */
		public static const CURRENT_ELEMENT:String = "currentElement";
		
		/**
		 * 没选中元素
		 */
		public static const UNSELECT_ELEMENT:String = "unSelectElement";
		
		/**
		 * 记录元素属性更改
		 */
		public static const CHANGE_RECORD:String = "changeRecord";
		
		/**
		 * 更新位置和尺寸
		 */
		public static const UPDATE_SIZE_AND_POSITION:String = "moveComplete";
		
		/**
		 * 元素
		 */
		public var element:ElementBase;
		
		public function ElementEvent(type:String, element:ElementBase = null)
		{
			super(type, true);
			this.element = element;
		}
	}
}