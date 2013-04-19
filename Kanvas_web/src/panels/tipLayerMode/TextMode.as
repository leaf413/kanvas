package panels.tipLayerMode
{
	import panels.ToolTipLayer;
	
	public class TextMode extends TipLayerModeBase
	{
		public function TextMode(tipLayer:ToolTipLayer)
		{
			super(tipLayer);
		}
		
		/**
		 */		
		override public function returnToScaleTipIcon():void
		{
			tipLayer.changeTipIcon(tipLayer.textIcon);
		}
		
		/**
		 */		
		override public function toTextMode():void
		{
			
		}
	}
}