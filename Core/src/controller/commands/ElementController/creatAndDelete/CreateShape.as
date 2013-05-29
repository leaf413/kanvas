package controller.commands.ElementController.creatAndDelete
{
	import controller.commands.CommandNames;
	
	import flash.geom.Rectangle;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ShapeVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	import util.ShapeVORecord;
	import util.XMLConfigKit.XMLVOMapper;
	
	import view.CanvasMediator;
	import view.Element.shapes.ShapeBase;
	import view.MediatorNames;
	
	/**
	 * 创建形状
	 * @author foxm
	 * 
	 */
	public class CreateShape extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var shape:ShapeBase;
		
		public function CreateShape()
		{
			super();
		}
		
		/**
		 * notification.getBody 传3种类型：1种是Rectangle创建另外一种是传shape\vo
		 * @param notification
		 * 
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			var shapeVO:ShapeVO;
			if (notification.getBody() is Rectangle)
			{
//				var shapeVORecor:ShapeVORecord = canvasProxy.shapeVORecord;
				
				shapeVO = new ShapeVO();
				shapeVO.id = ShapeCreator.shapeID;
				shapeVO.type = notification.getType();
				shapeVO.styleTempType = canvasProxy.style.currentShapeStyle.name().toString();
				XMLVOMapper.fuck(canvasProxy.style.currentShapeStyle, shapeVO);
				
				shapeVO.width = (notification.getBody() as Rectangle).width;
				shapeVO.height = (notification.getBody() as Rectangle).height;
//				shapeVO.color = shapeVORecor.color;
//				shapeVO.alpha = shapeVORecor.alpha;
//				shapeVO.frameColor = shapeVORecor.lineColor;
//				shapeVO.thickness = shapeVORecor.thickness;
//				shapeVO.frameAlpha = shapeVORecor.lineAlpha;
				
				shapeVO.x = (notification.getBody() as Rectangle).x;
				shapeVO.y = (notification.getBody() as Rectangle).y;
				
				shape = ShapeCreator.getShapeUI(shapeVO) as ShapeBase;
				
				create(shape);
				
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			else if(notification.getBody() is ShapeVO)
			{
				shapeVO = notification.getBody() as ShapeVO;
				shapeVO.id = ShapeCreator.shapeID;
				shape = ShapeCreator.getShapeUI(shapeVO) as ShapeBase;
				
				create(shape);
				
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			else
			{
				shape = notification.getBody() as ShapeBase;
				create(shape);
			}
		}
		
		private function create(shapeUI:ShapeBase):void
		{
			canvasProxy.addElement(shapeUI.vo); // VO
			canvasMediator.addElement(shapeUI); // UI
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, shapeUI);
//			this.sendNotification(CommandNames.SELECT_SHAPE, shapeUI);
		}
		
		override public function nextHandler():void
		{
			create(shape);
		}
		
		override public function returnHandler():void
		{
			this.sendNotification(CommandNames.ELEMENT_DELETE, shape);
		}
	}
}