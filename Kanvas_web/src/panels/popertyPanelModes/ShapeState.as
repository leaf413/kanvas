package panels.popertyPanelModes
{
	import panels.PropertyPanel;

	public class ShapeState extends PropertyStateBase
	{
		public function ShapeState(propertyPanel:PropertyPanel)
		{
			super(propertyPanel);
		}
		
		override public function toStageState():void
		{
			propertyPanel.currentState = PropertyStateBase.STAGE;
			propertyPanel.propertyState = propertyPanel.stageState;
		}
		
		override public function toTextState():void
		{
			propertyPanel.currentState = PropertyStateBase.TEXT;
			propertyPanel.propertyState = propertyPanel.textState;
		}
		
		override public function toImageState():void
		{
			propertyPanel.currentState = PropertyStateBase.IMAGE;
			propertyPanel.propertyState = propertyPanel.imageState;
		}
		
		override public function toGroupState():void
		{
			propertyPanel.currentState = PropertyStateBase.GROUP;
			propertyPanel.propertyState = propertyPanel.groupState;
		}
		
		override public function toLineState():void
		{
			propertyPanel.currentState = PropertyStateBase.LINE;
			propertyPanel.propertyState = propertyPanel.lineState;
		}
		
		override public function toTempGroupState():void
		{
			propertyPanel.currentState = PropertyStateBase.TEMPGROUP;
			propertyPanel.propertyState = propertyPanel.tempGroupState;
		}
		
		override public function toConnectState():void
		{
			propertyPanel.currentState = PropertyStateBase.CONNECT;
			propertyPanel.propertyState = propertyPanel.connectState;
		}
		
		override public function toTempGroupLineState():void
		{
			propertyPanel.currentState = PropertyStateBase.TEMPGROUPLINE;
			propertyPanel.propertyState = propertyPanel.tempGroupLineState;
		}
		
		override public function toTempGroupTextState():void
		{
			propertyPanel.currentState = PropertyStateBase.TEMPGROUPTEXT;
			propertyPanel.propertyState = propertyPanel.tempGroupTextState;
		}
	}
}