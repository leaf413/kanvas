package controller.commands.ElementController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.type.LayerTypes;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 改变元素图层
	 * @author foxm
	 * 
	 */
	public class ChangeElementLayer extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var element:ElementBase;
		
		private var type:String;
		
		private var oldIndex:int;
		
		private var newIndex:int;
		
		public function ChangeElementLayer()
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
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			
			type = notification.getType();
			
			if (notification.getBody())
			{
				element = notification.getBody() as ElementBase;
			}
			else
			{
				element = canvasMediator.getCurrentElement();
			}
			
			oldIndex = canvasMediator.canvas.getChildIndexElement(element);
			
			switch(type)
			{
				case LayerTypes.BRING_FORWARD:
				{
					canvasMediator.canvas.bringForward(element);
					break;
				}
				case LayerTypes.BRING_TO_FRONT:
				{
					canvasMediator.canvas.bringToFront(element);
					break;
				}
				case LayerTypes.SEND_BACK_WARD:
				{
					canvasMediator.canvas.sendBackWard(element);
					break;
				}
				case LayerTypes.SEND_TO_BACK:
				{
					canvasMediator.canvas.sendToBack(element);
					break;
				}
			}
			
			newIndex = canvasMediator.canvas.getChildIndexElement(element);
			
			canvasProxy.renturnAndNext.saveRecord(this);
		}
		
		override public function returnHandler():void
		{
			canvasMediator.canvas.setChildIndexElement(element, oldIndex);
		}
		
		override public function nextHandler():void
		{
			canvasMediator.canvas.setChildIndexElement(element, newIndex);
		}
	}
}