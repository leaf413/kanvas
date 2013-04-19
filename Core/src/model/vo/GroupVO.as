package model.vo
{
	import flash.events.IEventDispatcher;
	
	/**
	 * 群组VO
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class GroupVO extends ElementVO
	{
		
		public function GroupVO(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}