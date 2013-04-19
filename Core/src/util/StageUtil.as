package util
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * 初始化场景设置
	 * @author foxm
	 * 
	 */
	public class StageUtil
	{
		/**
		 * 下一步方法
		 */		
		private static var handler:Function;
		
		/**
		 * 容器
		 */
		private static var container:Sprite;
		
		public function StageUtil()
		{
		}
		
		public static function initStage(stage : Stage) : void
		{
			stage.stageFocusRect = false;  //指定对象在具有焦点时是否显示加亮的边框。
			stage.tabChildren = false;       //确定对象的子项是否支持 Tab 键。
			
			stage.quality = StageQuality.BEST; //指定使用极高呈现品质的值。
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		/**
		 * 初始化应用程序
		 * @param container 容器
		 * @param handler 下一步方法
		 */		
		public static function initApplication(_container:Sprite, _handler:Function):void
		{
			handler = _handler;
			container = _container;
			container.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler, false, 0, true);
		}
		
		/**
		 * 加入场景后处理事件
		 * @param evt
		 */		
		private static function addToStageHandler(evt:Event):void
		{
			container.removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			initStage(container.stage);
			handler();
			handler = null;
			container = null;
		}

	}
}