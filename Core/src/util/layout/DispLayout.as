package util.layout
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	/**
	 * 显示对象布局工具 version 01
	 */
	public class DispLayout
	{
		//对齐方式
		public static const top:String = "top";
		public static const buttom:String = "buttom";
		public static const left:String = "left";
		public static const right:String = "right";
		public static const center:String = "center";
		
		/**
		 */		
		public function DispLayout()
		{
		}
		
		/**
		 * @param	target 要布局的目标对象
		 * @param	parent  目标对象的父级容器
		 */
		public static function excuteLayout(target:DisplayObject, 
											parent:DisplayObjectContainer,layout:String=center):void
		{
			var targetX:Number = 0;
			var targetY:Number = 0;
			
			if (layout == center)
			{
				targetX = (parent.width - target.width) / 2;
				targetY = (parent.height - target.height) / 2;
			}
			
			target.x = targetX;
			target.y = targetY;
		}
		
		/**
		 * 调整对象至舞台正中心
		 */		
		public static function stageCenter(target:DisplayObject, stage:Stage):void
		{
			target.x = (stage.stageWidth - target.width) / 2;
			target.y = (stage.stageHeight - target.height) / 2;
		}
	}
}