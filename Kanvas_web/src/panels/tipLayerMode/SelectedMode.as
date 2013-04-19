package panels.tipLayerMode
{
	import panels.ToolTipLayer;
	
	public class SelectedMode extends TipLayerModeBase
	{
		public function SelectedMode(tipLayer:ToolTipLayer)
		{
			super(tipLayer);
		}
		
		/**
		 */		
		override public function returnToScaleTipIcon():void
		{
			tipLayer.changeTipIcon(tipLayer.selectorIcon);
		}
		
		/**
		 */		
		override public function toSelectedMode():void
		{
			
		}
		
	}
}