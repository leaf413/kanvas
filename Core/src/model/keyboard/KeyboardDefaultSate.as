package model.keyboard
{
	import controller.commands.CommandNames;
	import controller.event.CanvasEvent;
	import controller.event.KeyboardEvent;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	import mx.managers.FocusManager;
	
	import util.type.ZoomTypes;
	
	import view.CanvasMediator;
	
	/**
	 *键盘 默认状态
	 * @author work
	 * 
	 */
	public class KeyboardDefaultSate extends KeyboardStateBase
	{
		public function KeyboardDefaultSate(canvasMediator:CanvasMediator)
		{
			super(canvasMediator);
		}
		
		/**
		 *去编辑文档状态 
		 * 
		 */
		override public function toTextState():void
		{
			canvasMediator.currentKeyboardState = canvasMediator.textKeyboardState;
		}
		
		override public function keyUpBoardHandler(evt:flash.events.KeyboardEvent):void
		{
			switch(evt.keyCode)
			{
				
				case Keyboard.T:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_TEXT_MODE);
					break;
				
				case Keyboard.L:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_LINE_MODE);
					break;
				
				case Keyboard.S:
//					mainUIMediator.sendNotification(CommandNames.TOOL_BAR_TO_SHAPES_MODE);
					break;
				
				case Keyboard.M:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_ZOOM_IN_MODE);
					break;
				
				case Keyboard.N:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_ZOOM_OUT_MODE);
					break;
				
				case Keyboard.F:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_SCALE_MODE);
					break;
				
				case Keyboard.C:
					if (isdownCtrl)
					{
						canvasMediator.sendNotification(CommandNames.COPY_ELEMENT);
					}
					break;
				
				case Keyboard.V:
					if (isdownCtrl)
					{
						canvasMediator.sendNotification(CommandNames.PASTE_ELEMENT);
					}
					break;
				
				case Keyboard.V:
//					canvasMediator.sendNotification(CommandNames.TOOL_BAR_TO_SELECTED_MODE);
					break;
				
				case Keyboard.X:
					if (isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.CUT_SHAPE);
					}
					break;
				
				case Keyboard.A:
					if (isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.SELECT_ALL);
					}
					break;
				case Keyboard.G:
					if (evt.shiftKey && isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.UNGROUP_SHAPE);	
					}
					else
					{
//						canvasMediator.sendNotification(CommandNames.GROUP_SHAPE);	
					}
					break;
				case Keyboard.S:
					if (isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.EXPORT_SOURCE_DATA);
					}
					break;
				case Keyboard.O:
					if (isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.IMPORT_SOURCE_DATA);
					}
					break;
				case Keyboard.D:
					if (isdownCtrl)
					{
//						canvasMediator.sendNotification(CommandNames.COPY_CREATE_SHAPE);
					}
					break;
				case Keyboard.DELETE:
					canvasMediator.sendNotification(CommandNames.ELEMENT_DELETE);
					break;
				case Keyboard.ESCAPE:
//					canvasMediator.sendNotification(CommandNames.NOT_SELECTED_SHAPE);
					break;
				case Keyboard.UP:
//					canvasMediator.sendNotification(CommandNames.SHAPE_MOVE_UP);
					break;
				case Keyboard.DOWN:
//					canvasMediator.sendNotification(CommandNames.SHAPE_MOVE_DWON);
					break;
				case Keyboard.LEFT:
//					canvasMediator.sendNotification(CommandNames.SHAPE_MOVE_LEFT);
					break;
				case Keyboard.RIGHT:
//					canvasMediator.sendNotification(CommandNames.SHAPE_MOVE_RIGHT);
					break;
				case Keyboard.SPACE:
					canvasMediator.canvas.stage.focus = null;
					canvasMediator.canvas.dispatchEvent(new controller.event.KeyboardEvent(controller.event.KeyboardEvent.KEYBOARD_UP_SPACE));
					break;
				case Keyboard.CONTROL:
					isdownCtrl = false;
//					trace("ctrl up");
					break;
			}
		}
		
		private var isdownCtrl:Boolean = false;
		
		override public function keyDownBoardHandler(evt:flash.events.KeyboardEvent):void
		{
			switch(evt.keyCode)
			{
				case Keyboard.SPACE:
					canvasMediator.canvas.stage.focus = null;
 					canvasMediator.canvas.dispatchEvent(new controller.event.KeyboardEvent(controller.event.KeyboardEvent.KEYBOARD_DOWN_SPACE));
					break;
				case Keyboard.CONTROL:
					isdownCtrl = true;
//					trace("ctrl down");
					break;
			}
		}
		
		/**
		 * 鼠标事件处理
		 * @param evt
		 * 
		 */
		override public function mouseHandler(evt:MouseEvent):void
		{
			switch(evt.type)
			{
				case MouseEvent.MOUSE_WHEEL:
					if (evt.delta>0)
					{
						canvasMediator.sendNotification(CommandNames.ZOOM_CANVAS, null, ZoomTypes.ZOOM_IN);
					}
					else
					{
						canvasMediator.sendNotification(CommandNames.ZOOM_CANVAS, null, ZoomTypes.ZOOM_OUT);
					}
					break;
			}
		}
		
	}
}