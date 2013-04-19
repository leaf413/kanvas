package panels.toolBarModes
{
	import events.ToolBarEvent;
	
	import flash.geom.Point;
	
	import panels.ToolBarUI;
	import panels.ToolTipLayer;
	
	import util.type.ElementTypes;
	
	import view.Element.ElementBase;
	import view.Element.text.Text;

	public class TextMode extends ToolBarModeBase
	{
		public function TextMode(toolBar:ToolBarUI)
		{
			super(toolBar);
		}
		
		override public function outCanvas(toolTipLayer:ToolTipLayer):void
		{
			toolTipLayer.toSelectedMode();
		}
		
		override public function overCanvas(toolTipLayer:ToolTipLayer):void
		{
			super.overCanvas(toolTipLayer);
			toolTipLayer.toTextMode();
		}
		
		override public function downCanvas(coreApp:CoreApp):void
		{
			coreApp.elementController.creatElement(ElementTypes.TEXT,new Point(coreApp.canvas.mouseX,coreApp.canvas.mouseY));
		}
		
		override public function downShape(coreApp:CoreApp, element:ElementBase):void
		{
			if (element.vo.type == ElementTypes.TEXT)
			{
				(element as Text).toTextEditState();
			}
			else
			{
				coreApp.elementController.creatElement(ElementTypes.TEXT,new Point(coreApp.canvas.mouseX,coreApp.canvas.mouseY));
			}
			
		}
		
		/**
		 */		
//		override public function connectorSelected(connector:ConnectorUI):void
//		{
////			toolBarMediator.sendNotification(CommandNames.CREATE_TEXT_FIELD_SHAPE);
//		}
		
		/**
		 */		
//		override public function textSelected(textShapeVO:ShapeVO, type:String = null):void
//		{
////			textShapeVO.dispatchEvent(new TextUIEvent(TextUIEvent.TO_EDIT_STATE));
//		}
		
		
		/**
		 */		
//		override public function preSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.CREATE_TEXT_FIELD_SHAPE);
//		}
		
//		override public function groupSelect(value:Object):void
//		{
//			toolBarMediator.sendNotification(CommandNames.CREATE_TEXT_FIELD_SHAPE);
//		}
		
		/**
		 */		
//		override public function unSelect(editorProxy:EditorFieldProxy) : void
//		{
////			editorProxy.unSelectedText();
//		}
		
		/**
		 */		
		override public function toTextMode():void
		{
			
		}
		
	}
}