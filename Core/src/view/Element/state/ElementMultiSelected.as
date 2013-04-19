package view.Element.state
{
	import view.Element.ElementBase;
	
	/**
	 * 多选状态
	 * @author foxm
	 * 
	 */
	public class ElementMultiSelected extends ElementState
	{
		public function ElementMultiSelected(element:ElementBase)
		{
			super(element);
		}
		
		/**
		 * 没选择状态
		 */
		override public function toUnSelected():void
		{
			element.currentState = element.unSelectedState;
			element.setShapeBGisShow(false);
		}
	}
}