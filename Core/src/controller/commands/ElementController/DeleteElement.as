package controller.commands.ElementController
{
	import controller.commands.CommandNames;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ElementVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.type.ElementTypes;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.Element.shapes.ShapeBase;
	import view.MediatorNames;
	
	/**
	 * 删除元素
	 * @author foxm
	 * 
	 */
	public class DeleteElement extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var element:ElementBase;
		
		private var elementVO:ElementVO;
		
		public function DeleteElement()
		{
			super();
		}
		
		/**
		 * getBody 要删除的element
		 * 没有则删除当前的element
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			if (notification.getBody())
			{
				element = notification.getBody() as ElementBase;
				elementVO = element.vo;
			}
			else
			{
				element = canvasMediator.canvas.currentElement;
				elementVO = element.vo;
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			deleteShape(element);
		}
		
		/**
		 *  删除画布上的vo
		 */
		private function deleteShape(element:ElementBase):void
		{
			element.deleteSelf();
			canvasMediator.canvas.updateBound();
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, null); 
			canvasProxy.deleteElement(element.vo);
//			ExternalUtil.call("deleteShape", vo.id);
		}
		
		override public function returnHandler():void
		{
			switch(element.vo.type)
			{
				case ElementTypes.LINE:
//					this.sendNotification(CommandNames.ADD_LINE_SHAPE_UI , shapeUI, "return");
					break;
				case ElementTypes.IMAGE:
					this.sendNotification(CommandNames.CREATE_IMAGE, element);
					break;	
				case ElementTypes.GROUP:
					
					break;
				case ElementTypes.MULTISELECTION:
					
					break;
				case ElementTypes.TEXT:
//					this.sendNotification(CommandNames.CREATE_TEXT_FIELD_SHAPE , shapeUI);
					break;
				default:
					this.sendNotification(CommandNames.CREATE_SHAPE, element);
					break;
			}
		}
		
		override public function nextHandler():void
		{
			deleteShape(element);
		}
	}
}