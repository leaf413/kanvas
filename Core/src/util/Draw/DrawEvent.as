package util.Draw
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import model.vo.LineVO;
	
	/**
	 * 画线画框事件
	 * @author foxm
	 * 
	 */
	public class DrawEvent extends Event
	{
		/**
		 * 画线画框完成后发送信息
		 */
		public static const DRAW_RECT_COMPLETE:String = "drawComplete";
		
		/**
		 * 画线完成后发送信息
		 */
		public static const DRAW_LINE_COMPLETE:String = "drawLineComplete";
		
		/**
		 * 线条信息
		 */
		public var lineData:LineVO;
		
		/**
		 * 框信息
		 */
		public var rectData:Rectangle;
		
		public function DrawEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}