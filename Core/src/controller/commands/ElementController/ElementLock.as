package controller.commands.ElementController
{
	import controller.commands.CommandNames;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ShapeVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 元素锁定
	 * @author foxm
	 * 
	 */
	public class ElementLock extends SimpleCommand
	{
		private var element:ElementBase
		
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		public function ElementLock()
		{
			super();
		}
		
		/**
		 * getbody:ELEMENT 传入的是元素类型elementBase
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			if (notification.getBody())
			{
				element = notification.getBody() as ElementBase;
			}
			else
			{
				element = canvasMediator.getCurrentElement();
			}
			
			element.vo.isLock = !element.vo.isLock;
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT);
			canvasProxy.renturnAndNext.saveRecord(this);
		}
		
		override public function nextHandler():void
		{
			element.vo.isLock = !element.vo.isLock;
		}
		
		override public function returnHandler():void
		{
			element.vo.isLock = !element.vo.isLock;
		}
	}
}