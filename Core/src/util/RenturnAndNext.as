package util
{
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 返回前进控制类
	 * @author foxm
	 * 
	 */
	public class RenturnAndNext
	{
		/**
		 * 存放返回命令集
		 */
		public var returns:Vector.<SimpleCommand>;
		
		/**
		 * 存放前进命令集
		 */
		public var nexts:Vector.<SimpleCommand>;
		
		public function RenturnAndNext()
		{
			returns = new Vector.<SimpleCommand>;
			nexts = new Vector.<SimpleCommand>;
		}
		
		/**
		 * 返回
		 */
		public function toReturn():void
		{
			if (returns.length == 0)
				return;
			nexts.push(returns[returns.length - 1]);
			returns.pop().returnHandler();
		}
		
		/**
		 * 前进
		 */
		public function toNext():void
		{
			if (nexts.length == 0)
				return;
			returns.push(nexts[nexts.length - 1]);
			nexts.pop().nextHandler();
		}
		
		/**
		 * 保存操作过的记录
		 */
		public function saveRecord(command:SimpleCommand):void
		{
			returns.push(command);
			nexts.splice(0, nexts.length);
		}
	}
}