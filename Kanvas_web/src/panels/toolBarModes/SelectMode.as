package panels.toolBarModes
{
	import events.PropertyPanelEvent;
	import events.ToolBarEvent;
	
	import panels.ToolBarUI;
	
	import util.type.ElementTypes;
	
	import view.Element.ElementBase;
	

	public class SelectMode extends ToolBarModeBase
	{
		public function SelectMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		/**
		 */		
		override public function toSelectMode():void
		{
			
		}
		
//		override public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
//			if (type == CommonValues.TEXT_SELECTED_BY_MOUSE_DOWN)
//				textShapeVO.dispatchEvent(new TextUIEvent(TextUIEvent.TEXT_START_MOVE));
//			
//		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			coreApp.elementController.selectElement(element);
			coreApp.elementController.dragElement();
//			switch(element.vo.type)
//			{
//				case ElementTypes.LINE:
//					toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_CONNECT));
//					break;
//					
//				case ElementTypes.TEXT:
//					toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_TEXT));
//					break;
//				
//				case ElementTypes.IMAGE:
//					toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_IMAGE));
//					break;
//				
//				case ElementTypes.GROUP:
//					toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_GROUP));
//					break;
//					
//				default:
//				{
//					toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_SHAPE));
//					break;
//				}
//			}
			
		}
		
		/**
		 */		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.elementController.unSelectElement();
			coreApp.canvasController.drawFame();
//			toolBarUI.dispatchEvent(new PropertyPanelEvent(PropertyPanelEvent.PROPERTY_TO_STAGE));
		}
		
	}
}