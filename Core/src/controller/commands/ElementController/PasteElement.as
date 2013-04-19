package controller.commands.ElementController
{
	import controller.commands.CommandNames;
	
	import flash.geom.Point;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ElementVO;
	import model.vo.ImageVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.type.ElementTypes;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * 粘贴元素
	 * @author foxm
	 * 
	 */
	public class PasteElement extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		public function PasteElement()
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
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			var vo:ElementVO = canvasProxy.copyMap;
			if (!vo)
				return;
			vo.position = new Point(vo.position.x + 5, vo.position.y + 5);
			switch(vo.type)
			{
				case ElementTypes.IMAGE:
				{
					canvasMediator.sendNotification(CommandNames.CREATE_IMAGE, (vo as ImageVO).getBitmap); 
					break;
				}
					
				case ElementTypes.LINE:
				{
					canvasMediator.sendNotification(CommandNames.CREATE_LINE, vo); 
					break;
				}
					
				case ElementTypes.TEXT:
				{
					canvasMediator.sendNotification(CommandNames.CREATE_TEXT, vo); 
					break;
				}
					
				default:
				{
					canvasMediator.sendNotification(CommandNames.CREATE_SHAPE, vo); 
					break;
				}
			}
			
		}
	}
}