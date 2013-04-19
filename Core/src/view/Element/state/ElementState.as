package view.Element.state
{
	import view.Element.ElementBase;

	/**
	 * 元素选择状态
	 * @author foxm
	 * 
	 */
	public class ElementState
	{
		/**
		 * 元素
		 */
		protected var element:ElementBase;
		
		public function ElementState(element:ElementBase)
		{
			this.element = element;
		}
		
		/**
		 * 当前状态鼠标按下后处理方法
		 */
		public function mouseDown():void
		{
			
		}
		
		/**
		 * 当前状态鼠标弹起后处理方法
		 */
		public function mouseUp():void
		{
			
		}
		
		/**
		 * 当前状态鼠标移动中处理方法
		 */
		public function mouseMove():void
		{
			
		}
		
		/**
		 * 当前状态鼠标经过后处理方法
		 */
		public function mouseOver():void
		{
			
		}
		
		/**
		 * 当前状态鼠标离开后处理方法
		 */
		public function mouseOut():void
		{
			
		}
		
		/**
		 * 当双击
		 */
		public function doubleClick():void
		{
			
		}
		
		/**
		 * 选择状态
		 */
		public function toSelected():void
		{
			
		}
		
		/**
		 * 没选择状态
		 */
		public function toUnSelected():void
		{
			
		}
		
		/**
		 * 多选状态
		 */
		public function toMultiSelection():void
		{
		}
	}
}