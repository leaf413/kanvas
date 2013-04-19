package view.Element.groups
{
	import model.vo.GroupVO;
	
	import view.Element.ElementBase;
	
	/**
	 * 群组基类
	 * @author foxm
	 * 
	 */
	public class GroupBase extends ElementBase
	{
		/**
		 * 子集
		 */
		private var children:Vector.<ElementBase>;
		
		public function GroupBase(vo:GroupVO)
		{
			super(vo);
		}
		
		
	}
}