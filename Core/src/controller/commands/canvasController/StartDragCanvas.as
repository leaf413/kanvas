package controller.commands.canvasController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 开始拖动命令
	 * @author foxm
	 * 
	 */
	public class StartDragCanvas extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function StartDragCanvas()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			canvasMediator.moveCanvas.startMoveScreen();
		}
	}
}