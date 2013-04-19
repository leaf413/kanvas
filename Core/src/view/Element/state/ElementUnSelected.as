package view.Element.state
{
	import controller.event.ElementEvent;
	
	import view.Element.ElementBase;
	
	/**
	 * 没选中状态
	 * @author foxm
	 * 
	 */
	public class ElementUnSelected extends ElementState
	{
		public function ElementUnSelected(element:ElementBase)
		{
			super(element);
		}
		
		/**
		 * 当前状态鼠标按下后处理方法
		 */
		override public function mouseDown():void
		{
//			element.toSelectedState();
			element.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_DOWN, element));
		}
		
		/**
		 * 当前状态鼠标弹起后处理方法
		 */
		override public function mouseUp():void
		{
			element.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_UP, element));
		}
		
		/**
		 * 移动
		 */
		override public function mouseMove():void
		{
			element.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_MOVE, element));
		}
		
		/**
		 * 选择状态
		 */
		override public function toSelected():void
		{
			element.currentState = element.selectedState;
		}
		
		/**
		 * 多选状态
		 */
		override public function toMultiSelection():void
		{
			element.currentState = element.multiSelectedState;
		}
	}
}