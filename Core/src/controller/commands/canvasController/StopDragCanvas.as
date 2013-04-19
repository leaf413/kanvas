package controller.commands.canvasController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 停止移动画布
	 * @author foxm
	 * 
	 */
	public class StopDragCanvas extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function StopDragCanvas()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			canvasMediator.moveCanvas.stopMoveCanvas();
		}
	}
}