package util.Draw
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import util.BrokenLineDrawer;

	/**
	 * 画矩形框
	 * @author foxm
	 * 
	 */
	public class DrawRect
	{
		/**
		 * 装矩形容器
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
		
		/**
		 * @param container容器
		 * @param style样式
		 */
		public function DrawRect(container:Sprite, style:String = "default")
		{
			this.container = container;
			this.style = style;
		}
		
		/**
		 * 创建画虚线框
		 */
		public function startCreatRect():void
		{
			container.stage.addEventListener(MouseEvent.MOUSE_MOVE, dragBrokenRect, false, 0 , true);
			container.stage.addEventListener(MouseEvent.MOUSE_UP, sendRectData, false, 0, true);
			
			startX = container.parent.mouseX;
			startY = container.parent.mouseY;
		}
		
		/**
		 * 画虚线框
		 * @param e
		 */
		private function dragBrokenRect(e:MouseEvent):void
		{
			container.graphics.clear();
			
			switch(_style)
			{
				case DrawRect.STYLE_BROKEN:
				{
					BrokenLineDrawer.drawLine(container.graphics,new Point(startX, startY), new Point(container.parent.mouseX, startY), 1, 0x888888, 5);
					BrokenLineDrawer.drawLine(container.graphics,new Point(container.parent.mouseX, startY), new Point(container.parent.mouseX, container.parent.mouseY), 1, 0x888888, 5);
					BrokenLineDrawer.drawLine(container.graphics,new Point(startX, container.parent.mouseY), new Point(container.parent.mouseX, container.parent.mouseY), 1, 0x888888, 5);
					BrokenLineDrawer.drawLine(container.graphics,new Point(startX, startY), new Point(startX, container.parent.mouseY), 1, 0x888888, 5);
					break;
				}
					
				default:
				{
					container.graphics.beginFill(0xe0e0e0,0.5);
					container.graphics.lineStyle(1,0xababab,0.8);
					container.graphics.drawRect(startX, startY,  container.parent.mouseX - startX, container.parent.mouseY - startY);
					break;
				}
			}
			
		}
		
		/**
		 * 发送数据创建形状
		 * @param e
		 */
		private function sendRectData(e:MouseEvent):void
		{
			container.stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragBrokenRect);
			container.stage.removeEventListener(MouseEvent.MOUSE_UP, sendRectData);
			
			switch(_style)
			{
				case DrawRect.STYLE_BROKEN:
				{
					var complete:DrawEvent = new DrawEvent(DrawEvent.DRAW_RECT_COMPLETE);
					complete.rectData = container.getBounds(container.parent);
					container.dispatchEvent(complete);
					break;
				}
				case DrawRect.STYLE_DEFAULT:
				{
					break;
				}
			}
			
			
			
			container.graphics.clear();
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