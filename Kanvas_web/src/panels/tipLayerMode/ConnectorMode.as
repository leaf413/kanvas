package panels.tipLayerMode
{
	
	import panels.ToolTipLayer;
	
	public class ConnectorMode extends TipLayerModeBase
	{
		public function ConnectorMode(tipLayer:ToolTipLayer)
		{
			super(tipLayer);
		}
		
		/**
		 */		
		override public function returnToScaleTipIcon():void
		{
			tipLayer.changeTipIcon(tipLayer.connectorIcon);
		}
		
		/**
		 */		
		override public function toConnectorMode():void
		{
			
		}
		
	}
}