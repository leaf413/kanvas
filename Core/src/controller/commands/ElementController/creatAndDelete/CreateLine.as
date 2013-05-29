package controller.commands.ElementController.creatAndDelete
{
	import controller.commands.CommandNames;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.LineVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	import util.ShapeVORecord;
	import util.XMLConfigKit.XMLVOMapper;
	import util.type.ElementTypes;
	
	import view.CanvasMediator;
	import view.Element.Lines.Line;
	import view.MediatorNames;
	
	/**
	 * 创建线条
	 * @author foxm
	 * 
	 */
	public class CreateLine extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var line:Line;
		
		public function CreateLine()
		{
			super();
		}
		
		/**
		 * notification.getBody 传2种类型：1种是LineVO创建另外一种是传Line
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			var shapeVORecor:ShapeVORecord = canvasProxy.shapeVORecord;
			
			if (notification.getBody() is LineVO)
			{
				line = new Line(notification.getBody() as LineVO);
				line.vo.type = ElementTypes.LINE;
				line.vo.id = ShapeCreator.shapeID;
				line.vo.styleTempType = canvasProxy.style.currentlineStyle.name().toString();
				XMLVOMapper.fuck(canvasProxy.style.currentlineStyle, line.vo);
//				(line.vo as LineVO).color = shapeVORecor.color;
//				line.vo.alpha = shapeVORecor.alpha;
				
				canvasProxy.addElement(line.vo);
				canvasMediator.addElement(line);
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			else
			{
				line = notification.getBody() as Line;
				line.vo.type = ElementTypes.LINE;
				line.vo.id = ShapeCreator.shapeID;
//				(line.vo as LineVO).color = shapeVORecor.color;
//				line.vo.alpha = shapeVORecor.alpha;
				
				canvasProxy.addElement(line.vo);
				canvasMediator.addElement(line);
			}
			
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, line);
		}
		
		override public function nextHandler():void
		{
			canvasProxy.addElement(line.vo);
			canvasMediator.addElement(line);
			
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, line);
		}
		
		override public function returnHandler():void
		{
			this.sendNotification(CommandNames.ELEMENT_DELETE, line);
		}
	}
}