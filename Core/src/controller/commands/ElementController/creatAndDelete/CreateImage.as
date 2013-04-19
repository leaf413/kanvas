package controller.commands.ElementController.creatAndDelete
{
	import controller.commands.CommandNames;
	
	import flash.display.Bitmap;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	import model.vo.ImageVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	import util.type.ElementTypes;
	
	import view.CanvasMediator;
	import view.Element.ElementBase;
	import view.Element.images.Image;
	import view.MediatorNames;
	
	/**
	 * 创建图片
	 * @author foxm
	 * 
	 */
	public class CreateImage extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var image:ElementBase;
		
		public function CreateImage()
		{
			super();
		}
		
		/**
		 * getBody 2种类型传递：bitmap类型、 image
		 */
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			if (notification.getBody() is Bitmap)
			{
				var vo:ImageVO = new ImageVO();
				vo.id = ShapeCreator.shapeID;
				vo.bitmapID = canvasProxy.imageMap.id;
				vo.type = ElementTypes.IMAGE;
				vo.width = (notification.getBody() as Bitmap).width;
				vo.height = (notification.getBody() as Bitmap).height;
				
				canvasProxy.imageMap.setBitmap(vo.bitmapID.toString(), (notification.getBody() as Bitmap));
				vo.setBitmap = canvasProxy.imageMap.getBitmap(vo.bitmapID.toString());
				
				vo.position.x = (canvasMediator.canvas.stage.stageWidth - vo.width) / 2;
				vo.position.y = (canvasMediator.canvas.stage.stageHeight - vo.height) / 2;
				
				image = ShapeCreator.getShapeUI(vo);
				create(image);
				
				canvasProxy.renturnAndNext.saveRecord(this);
			}
			else
			{
				image = notification.getBody() as Image;
				create(image);
			}
		}
		
		private function create(imageUI:ElementBase):void
		{
			canvasProxy.addElement(imageUI.vo);
			canvasMediator.addElement(imageUI);
			
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, imageUI);
		}
		
		override public function nextHandler():void
		{
			create(image);
		}
		
		override public function returnHandler():void
		{
			this.sendNotification(CommandNames.ELEMENT_DELETE, image);
		}
	}
}