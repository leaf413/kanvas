package controller.commands.canvasController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 开始画线
	 * @author foxm
	 * 
	 */
	public class DrawLine extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function DrawLine()
		{
			super();
		}
		
		/**
		 * 执行
		 */
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			canvasMediator.canvas.startdrawLine();
		}
	}
}