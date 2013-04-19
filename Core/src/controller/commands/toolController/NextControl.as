package controller.commands.toolController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 下一步
	 * @author foxm
	 * 
	 */
	public class NextControl extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		public function NextControl()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasProxy.renturnAndNext.toNext();
		}
	}
}