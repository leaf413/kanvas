package controller.interfaceCommand
{
	import controller.commands.CommandNames;
	
	import util.type.DrawFameTypes;
	import util.type.ZoomTypes;

	/**
	 * 画布接口
	 * @author foxm
	 * 
	 */
	public class CanvasController
	{
		private var facade:CoreFacade;
		
		public function CanvasController(facade:CoreFacade)
		{
			this.facade = facade;
		}
		
		/**
		 * 放大画布
		 */
		public function zoomIn(value:Object = null):void
		{
			facade.sendNotification(CommandNames.ZOOM_CANVAS, value, ZoomTypes.ZOOM_IN);
		}
		
		/**
		 * 缩小画布
		 */
		public function zoomOut(value:Object = null):void
		{
			facade.sendNotification(CommandNames.ZOOM_CANVAS, value, ZoomTypes.ZOOM_OUT);
		}
		
		/**
		 * 缩小画布
		 */
		public function zoomAuto():void
		{
			facade.sendNotification(CommandNames.ZOOM_CANVAS, null, ZoomTypes.ZOOM_AUTO);
		}
		
		/**
		 * 百分百画布
		 */
		public function hundrerPercent():void
		{
			facade.sendNotification(CommandNames.ZOOM_CANVAS, null, ZoomTypes.HUNDRED_PERCENT);
		}
		
		/**
		 *  鼠标移开形状面板鼠标状态返回目前模式
		 */
		public function returnToTipIcon():void
		{
			facade.sendNotification(CommandNames.RETURN_TO_TIP_ICON);
		}
		
		/**
		 * 鼠标经过形状面板鼠标状体切换回选择
		 */
		public function changeSelectTipIcon():void
		{
			facade.sendNotification(CommandNames.SWITCH_TO_SELECTOR_TIP_ICON);
		}
		
		/**
		 * 移动画布
		 */
		public function startMoveCanvas():void
		{
			facade.sendNotification(CommandNames.START_MOVE_CANVAS);
		}
		
		/**
		 * 停止移动画布 
		 */
		public function stopMoveCanvas():void
		{
			facade.sendNotification(CommandNames.STOP_MOVE_CANVAS);
		}
		
		/**
		 * 画边框创建形状
		 */
		public function drawBrokenFame():void
		{
			facade.sendNotification(CommandNames.DRAW_FAME_CREAT_SHAPE,null,DrawFameTypes.BROKEN_FAME);
		}
		
		/**
		 * 画边框
		 */
		public function drawFame():void
		{
			facade.sendNotification(CommandNames.DRAW_FAME_CREAT_SHAPE,null,DrawFameTypes.MULTI_SELECTION_FAME);
		}
		
		/**
		 * 画线
		 */
		public function drawLine():void
		{
			facade.sendNotification(CommandNames.DRAW_LINE);
		}
		
		/**
		 * 初始化全局样式
		 */
		public function InitStyles(xml:XML):void
		{
			facade.sendNotification(CommandNames.INIT_CANVAS_STYLE,xml);
		}
		
	}
}