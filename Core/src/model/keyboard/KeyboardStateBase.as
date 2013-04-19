package model.keyboard
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import view.CanvasMediator;
	

	/**
	 * 键盘事件机制状态基类
	 * @author foxm
	 * 
	 */
	public class KeyboardStateBase
	{
		public function KeyboardStateBase(canvasMediator:CanvasMediator)
		{
			this.canvasMediator = canvasMediator;
		}
		
		/**
		 *默认状态 
		 * 
		 */
		public function toDefaultState():void
		{
			
		}
		
		/**
		 *文本状态 
		 * 
		 */
		public function toTextState():void
		{
			
		}
		
		/**
		 *键盘事件处理 
		 * 
		 */
		public function keyDownBoardHandler(evt:KeyboardEvent):void
		{
			
		}
		
		public function keyUpBoardHandler(evt:KeyboardEvent):void
		{
			
		}
		
		/**
		 * 鼠标事件处理
		 * @param evt
		 * 
		 */
		public function mouseHandler(evt:MouseEvent):void
		{
			
		}
		
		/**
		 *整个核心编辑区域 
		 */
		protected var canvasMediator:CanvasMediator;
	}
}