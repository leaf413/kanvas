package controller.commands.ElementController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ElementVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	public class SetStyle extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var element:ElementBase;
		
		private var elementVO:ElementVO;
		
		private var oldStyle:XML;
		
		private var newStyle:XML;
		
		/**
		 * 设置样式
		 */
		public function SetStyle()
		{
			super();
		}
		
		/**
		 * 
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			if (notification.getBody() is XML)
			{
			}
		}
		
		override public function returnHandler():void
		{
		
		}
		
		override public function nextHandler():void
		{
		}
	}
}