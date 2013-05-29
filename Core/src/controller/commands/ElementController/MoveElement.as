package controller.commands.ElementController
{
	import flash.geom.Point;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 移动元素
	 * @author foxm
	 * 
	 */
	public class MoveElement extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		/**
		 * 新坐标
		 */
		private var newPoint:Point;
		
		/**
		 * 旧坐标
		 */
		private var oldPoint:Point;
		
		private var element:ElementBase;
		
		public function MoveElement()
		{
			super();
		}
		
		/**
		 * getBody 是 point
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			element = canvasMediator.canvas.currentElement;
			
			newPoint = notification.getBody() as Point;
			oldPoint = new Point(element.vo.x,element.vo.y);
			
			element.moveTo(newPoint);
			canvasProxy.renturnAndNext.saveRecord(this);
		}
		
		override public function returnHandler():void
		{
			element.moveTo(oldPoint);
		}
		
		override public function nextHandler():void
		{
			element.moveTo(newPoint);
		}
	}
}