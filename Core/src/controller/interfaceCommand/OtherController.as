package controller.interfaceCommand
{
	import controller.commands.CommandNames;
	
	import util.XMLConfigKit.XMLVOLib;

	/**
	 * 未分类控制
	 * @author foxm
	 * 
	 */
	public class OtherController
	{
		private var facade:CoreFacade;
		
		public function OtherController(facade:CoreFacade)
		{
			this.facade = facade;
		}
		
		/**
		 * 导入文件
		 */
		public function importFile():void
		{
			facade.sendNotification(CommandNames.IMPORT_FILE);
		}
		
		/**
		 * 导出文件
		 */
		public function exportFile():void
		{
			facade.sendNotification(CommandNames.EXPORT_FILE);
		}
		
		/**
		 * 插入图片
		 */
		public function insertImage():void
		{
			facade.sendNotification(CommandNames.INSERT_IMAGE);
		}
		
		/**
		 * 保存图片
		 */
		public function saveImage():void
		{
			facade.sendNotification(CommandNames.SAVE_IMAGE);
		}
		
		/**
		 * 下一步
		 */
		public function next():void
		{
			facade.sendNotification(CommandNames.NEXT_CONTROL);
		}
		
		/**
		 * 上一步
		 */
		public function previous():void
		{
			facade.sendNotification(CommandNames.RETURN_CONTROL);
		}
		
		/**
		 * 改变全体样式
		 * @param xml
		 * 
		 */
		public function changeCanvasStyle(xml:XML):void
		{
			facade.sendNotification(CommandNames.CHANGE_CANVAS_STYLE, xml);
		}
		
		/**
		 * 测试样式改变随时可以删除
		 * 
		 */
		private var test:Boolean = true;
		public function testStyleChange():void
		{
			if (test)
			{
				changeCanvasStyle(XMLVOLib.getXML('stylesDefault', 'classic'));
				test = false;
			}
			else
			{
				changeCanvasStyle(XMLVOLib.getXML('stylesDefault', 'default'));
				test = true;
			}
				
		}
		
	}
}