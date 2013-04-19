package model.keyboard
{
	import flash.events.KeyboardEvent;
	
	import view.CanvasMediator;
	
	/**
	 * 键盘文档编辑状态
	 * @author foxm
	 * 
	 */
	public class KeyboardTextState extends KeyboardStateBase
	{
		public function KeyboardTextState(canvasMediator:CanvasMediator)
		{
			super(canvasMediator);
		}
		
		/**
		 *去默认状态 
		 * 
		 */
		override public function toDefaultState():void
		{
			canvasMediator.currentKeyboardState = canvasMediator.defaultKeyboardState;
		}
		
		/**
		 *键盘事件处理 
		 * 
		 */
		override public function keyDownBoardHandler(evt:KeyboardEvent):void
		{
		}
		
		override public function keyUpBoardHandler(evt:KeyboardEvent):void
		{
		}
	}
}