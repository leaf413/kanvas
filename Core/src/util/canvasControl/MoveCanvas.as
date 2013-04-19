package util.canvasControl
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * 移动画布
	 * @author foxm
	 * 
	 */
	public class MoveCanvas
	{
		/**
		 * 记录坐标
		 */		
		private var startPoint:Point = new Point();
		
		/**
		 * 要移动的画布
		 */
		private var canvas:Sprite;
		
		public function MoveCanvas(canvas:Sprite)
		{
			this.canvas = canvas;
		}
		
		/**
		 * 移动屏幕
		 */		
		public function startMoveScreen():void
		{
			canvas.stage.addEventListener(MouseEvent.MOUSE_DOWN, startMoveHandler, false, 0, true);
		}
		
		/**
		 * 开始移动屏幕
		 */		
		private function startMoveHandler(evt:MouseEvent):void
		{
			startPoint.x = canvas.stage.mouseX;
			startPoint.y = canvas.stage.mouseY;
			
			canvas.stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler, false, 0, true);
			canvas.stage.addEventListener(MouseEvent.MOUSE_UP, stopMoveCanvas, false, 0, true);
		}
		
		/**
		 * 停止移动屏幕
		 */		
		public function stopMoveCanvas(evt:MouseEvent = null):void
		{
			canvas.stage.removeEventListener(MouseEvent.MOUSE_DOWN, startMoveHandler);
			canvas.stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
			canvas.stage.removeEventListener(MouseEvent.MOUSE_UP, stopMoveCanvas);
		}
		
		/**
		 * 屏幕移动过程
		 */		
		private function moveHandler(evt:MouseEvent):void
		{
			var disX:Number = canvas.stage.mouseX - startPoint.x;
			var disY:Number = canvas.stage.mouseY - startPoint.y;
			
			canvas.x += disX;
			canvas.y += disY;
			
			startPoint.x = canvas.stage.mouseX;
			startPoint.y = canvas.stage.mouseY;
		}
	}
}