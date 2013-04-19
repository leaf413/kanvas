package controller.commands.ElementController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 改变元素属性
	 * @author foxm
	 * 
	 */
	public class ChangeElementProterty extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		/**
		 * 类型
		 */
		private var type:String = '';
		
		/**
		 * 属性
		 */
		private var body:Object;
		
		/**
		 * 旧属性
		 */
		private var oldBody:Object;
		
		/**
		 * 元素
		 */
		private var element:ElementBase;
		
		public function ChangeElementProterty()
		{
			super();
		}
		
		/**
		 * 执行
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			type = notification.getType();
			body = notification.getBody();
			element = canvasMediator.getCurrentElement();
			oldBody = element.vo[type];
			canvasMediator.changeElementProperty(type, body, element);
			canvasProxy.renturnAndNext.saveRecord(this);
		}
		
		override public function returnHandler():void
		{
			canvasMediator.changeElementProperty(type, oldBody, element);
		}
		
		override public function nextHandler():void
		{
			canvasMediator.changeElementProperty(type, body, element);
		}
	}
}