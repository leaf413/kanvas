package model.vo.event
{
	import flash.events.Event;
	
	/**
	 * 属性更改事件
	 * @author foxm
	 * 
	 */
	public class ElementChangeProperty extends Event
	{
		
		public function ElementChangeProperty(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}