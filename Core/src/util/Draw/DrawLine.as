package util.Draw
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import model.vo.LineVO;
	
	import spark.primitives.Line;
	
	import util.BrokenLineDrawer;

	/**
	 * 画线条
	 * @author foxm
	 * 
	 */
	public class DrawLine
	{
		/**
		 * 装线条容器
		 */
		private var container:Sprite;
		
		/**
		 * 记录鼠标按下坐标X
		 */		
		private var startX:Number;
		
		/**
		 * 记录鼠标按下坐标Y
		 */
		private var startY:Number;
		
		/**
		 * 鼠标松开坐标X
		 */		
		private var endX:Number;
		
		/**
		 * 鼠标松开坐标Y
		 */
		private var endY:Number;
		
		/**
		 * 虚线样式
		 */
		public static const STYLE_BROKEN:String = "broken";
		
		/**
		 * 默认样式
		 */
		public static const STYLE_DEFAULT:String = "default";
		
		/**
		 * 样式
		 */
		private var _style:String = "";
		
		public function DrawLine(container:Sprite, style:String = "default")
		{
			this.container = container;
			this.style = style;
		}
		
		/**
		 *创建线条 
		 * 
		 */
		public function startdrawLine():void
		{
			container.stage.addEventListener(MouseEvent.MOUSE_MOVE, drawLine, false, 0 , true);
			container.stage.addEventListener(MouseEvent.MOUSE_UP, sendLineData, false, 0, true);
			
			startX = container.parent.mouseX;
			startY = container.parent.mouseY;
		}
		
		/**
		 * 画预览线
		 * @param e
		 * 
		 */
		private function drawLine(e:MouseEvent):void
		{
			container.graphics.clear();
			switch(_style)
			{
				case DrawRect.STYLE_BROKEN:
				{
					BrokenLineDrawer.drawLine(container.graphics,new Point(startX, startY), new Point(container.parent.mouseX, container.parent.mouseY), 1, 0x888888, 5);
					break;
				}
					
				default:
				{
					BrokenLineDrawer.drawLine(container.graphics,new Point(startX, startY), new Point(container.parent.mouseX, container.parent.mouseY), 1, 0x888888, 0);
					break;
				}
			}
		}
		
		/**
		 * 发送数据创建线条()
		 * @param e
		 * 
		 */
		private function sendLineData(e:MouseEvent):void
		{
			container.stage.removeEventListener(MouseEvent.MOUSE_MOVE, drawLine);
			container.stage.removeEventListener(MouseEvent.MOUSE_UP, sendLineData);
			
			container.graphics.clear();
			endX = container.parent.mouseX;
			endY = container.parent.mouseY;
			if (startX == endX && startY == endY)
				return;
			
			var complete:DrawEvent = new DrawEvent(DrawEvent.DRAW_LINE_COMPLETE);
			var lineVO:LineVO = new LineVO();
			lineVO.startPoint = new Point(startX, startY);
			lineVO.endPoint = new Point(endX, endY);
			lineVO.width = endX - startX;
			lineVO.height = endY - startY;
			complete.lineData = lineVO;
			container.dispatchEvent(complete);
		}
		
		public function set style(value:String):void 
		{
			_style = value;
		}
		
		public function get style():String 
		{
			return _style;
		}
	}
}