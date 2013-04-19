package panels.tipLayerMode
{
	import flash.display.DisplayObject;
	import flash.ui.Mouse;
	
	
	import panels.ToolTipLayer;

	/**
	 * 提示图层状态模式
	 * @author foxm
	 * 
	 */
	public class TipLayerModeBase
	{
		
		public function TipLayerModeBase(tipLayer:ToolTipLayer)
		{
			this.tipLayer = tipLayer;
		}
		
		/**
		 * 当从形变控制点移开时，返回到初始状态；
		 */
		public function returnToScaleTipIcon():void
		{
			tipLayer.changeTipIcon(tipLayer.scaledIcon);
		}
		
		/**
		 * 进入文字模式
		 */		
		public function toTextMode():void
		{
			tipLayer.currentMode = tipLayer.textMode;
			tipLayer.changeTipIcon(tipLayer.textIcon);
		}
		
		/**
		 *进入选择模式 
		 * 
		 */
		public function toSelectedMode():void
		{
			tipLayer.currentMode = tipLayer.selectedMode;
			tipLayer.changeTipIcon(tipLayer.selectorIcon);
		}
		
		/**
		 *进入缩放模式 
		 * 
		 */
		public function toScaledMode():void
		{
			tipLayer.currentMode = tipLayer.scaledMode;
			tipLayer.changeTipIcon(tipLayer.scaledIcon);
		}
		
		/**
		 *进入连线模式 
		 * 
		 */
		public function toConnectorMode():void
		{
			tipLayer.currentMode = tipLayer.connectorMode;
			tipLayer.changeTipIcon(tipLayer.connectorIcon);
		}
		
		/**
		 *进入全屏模式 
		 * 
		 */
		public function toModeScreenMode():void
		{
			tipLayer.currentMode = tipLayer.moveScreenMode;
			tipLayer.changeTipIcon(tipLayer.moveScreenIcon);
		}
		
		/**
		 * 进入放大模式
		 * 
		 */
		public function toZoomInMode():void
		{
			tipLayer.currentMode = tipLayer.zoomInMode;
			tipLayer.changeTipIcon(tipLayer.zoomInIcon);
		}
		
		/**
		 *进入缩小模式 
		 * 
		 */
		public function toZoomOutMode():void
		{
			tipLayer.currentMode = tipLayer.zoomOutMode;
			tipLayer.changeTipIcon(tipLayer.zoomOutIcon);
		}
		
		/**
		 * 整个程序的最上层， 用来处理加载提示， 鼠标的指针状态
		 */		
		protected var tipLayer:ToolTipLayer;
	}
}