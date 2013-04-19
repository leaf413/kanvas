package controller.commands.canvasController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.type.DrawFameTypes;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 画矩形框
	 * @author foxm
	 * 
	 */
	public class DrawFame extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function DrawFame()
		{
			super();
		}
		
		/**
		 * 执行
		 * getBody 缩放比例
		 * getType 缩放类型
		 */
		override public function execute(notification:INotification):void
		{
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			switch(notification.getType())
			{
				case DrawFameTypes.BROKEN_FAME:
				{
					canvasMediator.canvas.startCreatBrokenRect();
					break;
				}
					
				case DrawFameTypes.MULTI_SELECTION_FAME:
				{
					canvasMediator.canvas.starCreatRect();
					break;
				}
			}
		}
	}
}