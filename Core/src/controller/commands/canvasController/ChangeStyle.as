package controller.commands.canvasController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.XMLConfigKit.XMLVOLib;
	import util.XMLConfigKit.XMLVOMapper;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	public class ChangeStyle extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		public function ChangeStyle()
		{
			super();
		}
		/**
		 * getBody 是XML类型
		 * @param notification
		 * ß
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			var config:XML = XML(notification.getBody()).copy();
			
			canvasProxy.style.currentStyleType = config.name().toString();
			
			canvasProxy.setAllElementStyle(config);
			canvasMediator.renderAllElement();
		}
	}
}