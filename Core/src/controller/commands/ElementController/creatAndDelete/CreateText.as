package controller.commands.ElementController.creatAndDelete
{
	import controller.commands.CommandNames;
	
	import flash.geom.Point;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.TextVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	import util.ShapeVORecord;
	import util.type.ElementTypes;
	
	import view.CanvasMediator;
	import view.Element.text.Text;
	import view.MediatorNames;
	
	/**
	 * 创建文字
	 * @author foxm
	 * 
	 */
	public class CreateText extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var text:Text;
		
		public function CreateText()
		{
			super();
		}
		
		/**
		 * notification.getBody 传递point或者TEXT过来
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			var shapeVORecor:ShapeVORecord = canvasProxy.shapeVORecord;
			
			var textVO:TextVO;
			
			if (notification.getBody() is TextVO)
			{
				textVO = notification.getBody() as TextVO;
				textVO.id = ShapeCreator.shapeID;
				text = ShapeCreator.getShapeUI(textVO) as Text;
				create(text);
				text.toTextUsualState();
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			else
			{
				textVO = new TextVO();
				
				textVO.id = ShapeCreator.shapeID;
				textVO.type = ElementTypes.TEXT;
				
				ShapeCreator.setShapeSize(textVO);
				(textVO as TextVO).align = shapeVORecor.align;
				(textVO as TextVO).bold = shapeVORecor.isBold;
				(textVO as TextVO).color = shapeVORecor.color;
				(textVO as TextVO).font = shapeVORecor.font;
				(textVO as TextVO).italic = shapeVORecor.italic;
				(textVO as TextVO).size = shapeVORecor.fontSize;
				(textVO as TextVO).underline = shapeVORecor.underline;
				(textVO as TextVO).alpha = shapeVORecor.alpha;
				
				
				textVO.position.x = (notification.getBody() as Point).x;
				textVO.position.y = (notification.getBody() as Point).y;
				
				// Create shapeUI.
				text = ShapeCreator.getShapeUI(textVO) as Text;
				create(text);
				
				canvasProxy.renturnAndNext.saveRecord(this);
			}
		}
		
		private function create(text:Text):void
		{
			canvasProxy.addElement(text.vo); // VO
			canvasMediator.addElement(text); // UI
			
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, this.text);
			text.toTextEditState();
		}
		
		override public function nextHandler():void
		{
			create(text);
		}
		
		override public function returnHandler():void
		{
			this.sendNotification(CommandNames.ELEMENT_DELETE, text);
		}
	}
}