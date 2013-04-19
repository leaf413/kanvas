package panels.tipLayerMode
{
	import panels.ToolTipLayer;
	
	public class MoveScreenMode extends TipLayerModeBase
	{
		public function MoveScreenMode(tipLayer:ToolTipLayer)
		{
			super(tipLayer);
		}
		
		/**
		 */		
		override public function returnToScaleTipIcon():void
		{
			tipLayer.changeTipIcon(tipLayer.moveScreenIcon);
		}
		
		override public function toModeScreenMode():void
		{
			
		}
	}
}