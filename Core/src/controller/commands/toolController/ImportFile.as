package controller.commands.toolController
{
	import controller.commands.CommandNames;
	
	import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.ShapeCreator;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	public class ImportFile extends SimpleCommand
	{
		private var canvasProxy:CanvasProxy;
		
		private var canvasMediator:CanvasMediator;
		
		private var fileReference:FileReference;
		
		/**
		 * 配置文件数据
		 */
		private var configByteArr:ByteArray;
		
		/**
		 * 文件数据
		 */
		private var fileByteArr:ByteArray;
		
		public function ImportFile()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
			fileReference = new FileReference();
			
			fileReference.browse([new FileFilter("Files (*.xml)", "*.xml")]);
			fileReference.addEventListener(Event.SELECT,onFileSelected);
		}
		
		private function onFileSelected(e:Event):void 
		{
			fileReference.addEventListener(Event.COMPLETE, onFileLoaded);
			fileReference.load();
		}
		
		private function onFileLoaded(e:Event = null):void 
		{
			configByteArr = e.target.data;
			var config:XML = XML(configByteArr.readUTFBytes(configByteArr.length));
//			trace(config);
			
			this.sendNotification(CommandNames.SET_CURRENT_ELEMENT, null); 
			
			canvasProxy.removeAllShape();
			canvasProxy.imageMap.cleanAllBitmap();
			canvasProxy.imageMap.setBaseID(0);
			ShapeCreator.setShapeID(0);
			
			canvasProxy.dataMapping(config);
			
			
			
			this.sendNotification(CommandNames.RENDER_CANVAS);
		}
	}
}