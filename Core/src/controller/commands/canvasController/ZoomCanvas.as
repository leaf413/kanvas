package controller.commands.canvasController
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.type.ZoomTypes;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 缩放画布命令
	 * @author foxm
	 * 
	 */
	public class ZoomCanvas extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		public function ZoomCanvas()
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
				case ZoomTypes.ZOOM_IN:
				{
					if (notification.getBody())
					{
						canvasMediator.zoomIn(notification.getBody() as Number);
					}
					else
					{
						canvasMediator.zoomIn();
					}
					break;
				}
					
				case ZoomTypes.ZOOM_OUT:
				{
					if (notification.getBody())
					{
						canvasMediator.zoomOut(notification.getBody() as Number);
					}
					else
					{
						canvasMediator.zoomOut();
					}
					break;
				}
				
				case ZoomTypes.ZOOM_AUTO:
				{
					canvasMediator.zoomAuto();
					break;
				}
					
				case ZoomTypes.HUNDRED_PERCENT:
				{
					canvasMediator.hundredPercent();
					break;
				}
			}
		}
	}
}