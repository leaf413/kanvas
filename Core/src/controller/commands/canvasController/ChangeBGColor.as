package controller.commands.canvasController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 改变背景颜色
	 * @author foxm
	 * 
	 */
	public class ChangeBGColor extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		public function ChangeBGColor()
		{
			super();
		}
		
		/**
		 * getBody 是unit类型颜色
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			canvasProxy.canvasColor = notification.getBody() as uint;
			canvasMediator.changeBGColor();
		}
	}
}