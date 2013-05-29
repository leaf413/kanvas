package controller.commands.canvasController
{
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ElementVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.MediatorNames;
	
	/**
	 * 根据数据重新渲染整体
	 * @author MC102
	 * 
	 */
	public class RenderCanvas extends SimpleCommand
	{
		private var canvasMediator:CanvasMediator;
		
		private var canvasProxy:CanvasProxy;
		
		public function RenderCanvas()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			canvasMediator.clearAllShapes();
					
			for (var i:int = 0; i < canvasProxy.allElementVOes.length; i++) 
			{
				var vo:ElementVO = canvasProxy.allElementVOes[i]
				var element:ElementBase = ShapeCreator.getShapeUI(vo);
				canvasMediator.addElement(element);
			}
			
			canvasMediator.changeBGColor();
			canvasMediator.renderAllElement();
		}
	}
}