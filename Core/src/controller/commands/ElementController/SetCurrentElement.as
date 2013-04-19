package controller.commands.ElementController
{
	import controller.event.CanvasEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 设置当前元素
	 * @author foxm
	 * 
	 */
	public class SetCurrentElement extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function SetCurrentElement()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			if (notification.getBody())
			{
				(notification.getBody() as ElementBase).toSelectedState();
				canvasMediator.canvas.currentElement = notification.getBody() as ElementBase;
//				var e:CanvasEvent = new CanvasEvent(CanvasEvent.CURRENT_ELEMENT);
//				e.element = canvasMediator.canvas.currentElement;
//				canvasMediator.canvas.dispatchEvent(e);
			}
			else
			{
				if (canvasMediator.canvas.currentElement)
				{
					canvasMediator.canvas.currentElement.toUnSelectedState();
					canvasMediator.canvas.currentElement = null;
				}
			}
			
		}
	}
}