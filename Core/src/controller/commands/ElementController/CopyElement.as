package controller.commands.ElementController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ElementVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 复制元素
	 * @author foxm
	 * 
	 */
	public class CopyElement extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		public function CopyElement()
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
			
			canvasProxy.copyMap = canvasMediator.getCurrentElement().vo;
		}
	}
}