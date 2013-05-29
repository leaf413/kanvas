package controller.interfaceCommand
{
	import controller.commands.CommandNames;
	
	import flash.geom.Rectangle;
	
	import util.type.ElementProperty;
	import util.type.ElementTypes;
	import util.type.LayerTypes;
	import util.type.TextFormatTypes;

	/**
	 * 元素控制器
	 * @author foxm
	 * 
	 */
	public class ElementController
	{
		private var facade:CoreFacade;
		
		public function ElementController(facade:CoreFacade)
		{
			this.facade = facade;
		}
		
		/**
		 * 元素至最下层
		 */
		public function elementToBottomLayer():void
		{
			facade.sendNotification(CommandNames.ELEMENT_CHANGE_LAYER, null, LayerTypes.SEND_TO_BACK);
		}
		
		/**
		 * 元素至最上层
		 */
		public function elementToTopLayer():void
		{
			facade.sendNotification(CommandNames.ELEMENT_CHANGE_LAYER, null, LayerTypes.BRING_TO_FRONT);
		}
		
		/**
		 * 删除元素
		 */
		public function deleteElement():void
		{
			facade.sendNotification(CommandNames.ELEMENT_DELETE);
		}
		
		/**
		 * 快速复制元素
		 */
		public function duplicateElement():void
		{
			facade.sendNotification(CommandNames.COPY_ELEMENT);
			facade.sendNotification(CommandNames.PASTE_ELEMENT);
		}
		
		/**
		 * 群组元素
		 */
		public function groupElement():void
		{
			facade.sendNotification(CommandNames.ELEMENT_GROUP);
		}
		
		/**
		 * 解元素群组
		 */
		public function unGroupElement():void
		{
			facade.sendNotification(CommandNames.ELEMENT_UNGROUP);
		}
		
		/**
		 * 扩展元素(知识地图用)
		 */
		public function extensionElement():void
		{
			facade.sendNotification(CommandNames.ELEMENT_EXTENSION);
		}
		
		
		/**
		 * 改变元素属性
		 * @param value
		 * 
		 */
		public function changeElementProperty(value:Object, type:String):void
		{
			facade.sendNotification(CommandNames.ELEMENT_CHANGE_PROPERTY, value, type);
		}
		
		/**
		 * 元素下对齐
		 */
		public function ElementAlignBottom():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_BOTTOM);
		}
		
		/**
		 * 元素左对齐
		 */
		public function elementAlignLeft():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_LEFT);
		}
		
		/**
		 * 元素右对齐
		 */
		public function elementAlignRight():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_RIGHT);
		}
		
		/**
		 * 元素上对齐
		 */
		public function elementAlignTop():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_TOP);
		}
		
		/**
		 * 元素竖居中对齐
		 */
		public function elementAlignMiddleVertical():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_MIDDLE_VERTICAL);
		}
		
		/**
		 * 元素横居中对齐
		 */
		public function elementAlignMiddleHorizontal():void
		{
			facade.sendNotification(CommandNames.ELEMENT_ALIGN_MIDDLE_HORIZONTAL);
		}
		
		/**
		 * 元素锁定
		 */
		public function elementLock():void
		{
			facade.sendNotification(CommandNames.ELEMENT_LOCK);
		}
		
		/**
		 * 复制元素
		 */
		public function copyElement():void
		{
			
		}
		
		
		/**
		 * 创建元素
		 * @param type 创建元素的类型
		 * @param fame 
		 * 
		 */
		public function creatElement(type:String, body:Object):void
		{
			switch(type)
			{
				case ElementTypes.LINE:
					facade.sendNotification(CommandNames.CREATE_LINE, body, type);
					break;
				
				case ElementTypes.TEXT:
				{
					facade.sendNotification(CommandNames.CREATE_TEXT, body, type);
					break;
				}
					
				default:
				{
					facade.sendNotification(CommandNames.CREATE_SHAPE, body, type);
					break;
				}
			}
		}
		
		/**
		 * 改变背景颜色
		 * @param value
		 * 
		 */
		public function changeBGColor(value:Object):void
		{
			facade.sendNotification(CommandNames.BG_CHANGE_COLOR, value);
		}
		
		/**
		 * 选择元素
		 */
		public function selectElement(value:Object):void
		{
			facade.sendNotification(CommandNames.SET_CURRENT_ELEMENT, value);
		}
		
		/**
		 * 木有选择元素
		 */
		public function unSelectElement():void
		{
			facade.sendNotification(CommandNames.SET_CURRENT_ELEMENT);
		}
		
		/**
		 * 开始移动元素
		 */
		public function dragElement():void
		{
			facade.sendNotification(CommandNames.DRAG_ELEMENT);
		}
		
		/**
		 * 设置样式
		 */
		public function setStyle(xml:XML):void
		{
			facade.sendNotification(CommandNames.SET_STYLE, xml);
		}
	}
}