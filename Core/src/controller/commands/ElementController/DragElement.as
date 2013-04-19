package controller.commands.ElementController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 开始拖动元素
	 * @author foxm
	 * 
	 */
	public class DragElement extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function DragElement()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			canvasMediator.startMoveElement();
		}
	}
}