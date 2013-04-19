package controller.commands.toolController
{
	import controller.commands.CommandNames;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 插入图片
	 * @author foxm
	 * 
	 */
	public class InserImage extends SimpleCommand
	{
		private var fileReference:FileReference = new FileReference();
		
		public function InserImage()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			fileReference.browse([new FileFilter("Images", "*.jpg;*.gif;*.png")]);
			fileReference.addEventListener(Event.SELECT,onFileSelected);
		}
		
		private function onFileSelected(e:Event):void 
		{
			fileReference.addEventListener(Event.COMPLETE, onFileLoaded);
			fileReference.load();
//			facade.sendNotification(CommandNames.SHOW_LOADING);
		}
		
		private function onFileLoaded(e:Event):void 
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,imageLoaded);
			loader.loadBytes(e.target.data);
			
		}
		
		private function imageLoaded(evt:Event):void
		{
			var bitmap:Bitmap = Bitmap(evt.target.content);
//			facade.sendNotification(CommandNames.HIDE_LOADING);
			facade.sendNotification(CommandNames.CREATE_IMAGE, bitmap);
		}
	}
}