package model.vo.interfaceVO
{
	/**
	 * 允许锁定
	 * @author foxm
	 */
	public interface Ilock
	{
		function set isLock(value:Boolean):void;
		function get isLock():Boolean;
	}
}