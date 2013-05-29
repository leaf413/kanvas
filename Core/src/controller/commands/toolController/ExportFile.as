package controller.commands.toolController
{
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import util.zip.ZipEntry;
	import util.zip.ZipOutput;
	
	import view.CanvasMediator;
	import view.MediatorNames;
	
	public class ExportFile extends SimpleCommand
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
		
		private var zipOut:ZipOutput;
		
		public function ExportFile()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			canvasProxy = facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy;
			canvasMediator = facade.retrieveMediator(MediatorNames.CANVAS) as CanvasMediator;
			
//			var configName:String = 'config.xml';
//			var configZE:ZipEntry = new ZipEntry(configName);
//				
			fileReference = new FileReference();
			configByteArr = new ByteArray();
			
			var config:XML = canvasProxy.getAllData().copy();
			trace(config);
			configByteArr.writeUTFBytes(config.toXMLString());
//			configByteArr.writeMultiByte(config.toXMLString(),'utf-8');
//			configByteArr.compress();
//			zipOut = new ZipOutput();
//			zipOut.putNextEntry(configZE);
//			zipOut.write(configByteArr);
//			zipOut.closeEntry();
//			zipOut.finish();
//			fileByteArr = zipOut.byteArray;
			fileReference.save(configByteArr,"保存文件.xml");
		}
	}
}