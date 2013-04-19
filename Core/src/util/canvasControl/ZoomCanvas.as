package util.canvasControl
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * 缩放画布
	 * @author foxm
	 * 
	 */
	public class ZoomCanvas
	{
		
		/**
		 * 要移动的画布
		 */
		private var canvas:Sprite;
		
		/**
		 * 画布显示内容边界
		 */
		private var _bound:Rectangle;
		
		/**
		 * 缩放的倍数
		 */
		private var scale:Number = 1;
		
		/**
		 * 最大缩放比例
		 */
		private const maxScale:Number = 10;
		
		/**
		 * 最小缩放比例
		 */
		private const minScale:Number = 0.05;
		
	
		
		/**
		 * 缩放画布功能
		 * @param canvas 画布
		 * @param bound 画布内容边界
		 * 
		 */
		public function ZoomCanvas(canvas:Sprite, bound:Rectangle = null)
		{
			this.canvas = canvas;
			this._bound = bound;
		}
		
		/**
		 * 放大画布
		 * @param multiple（放大倍数）
		 * 
		 */
		public function zoomIn(multiple:Number = 1.2):void
		{
			var canvasX:Number = (canvas.mouseX - canvas.x);
			var canvasY:Number = (canvas.mouseY - canvas.y);
			scale *= multiple;
			if (scale >= maxScale)
			{
				return;
			}
			else
			{
				canvas.scaleX = canvas.scaleY = scale;
				canvas.x += canvasX - (canvasX * multiple);
				canvas.y += canvasY - (canvasY * multiple);
			}
		}
		
		/**
		 * 缩小画布
		 * @param multiple（缩小倍数）
		 */
		public function zoomOut(multiple:Number = 1.2):void
		{
			var canvasX:Number = (canvas.mouseX - canvas.x);
			var canvasY:Number = (canvas.mouseY - canvas.y);
			scale /= multiple;
			if (scale <= minScale)
			{
				return;
			}
			else
			{
				canvas.scaleX = canvas.scaleY = scale;
				canvas.x += canvasX - (canvasX / multiple);
				canvas.y += canvasY - (canvasY / multiple);
			}
		}
		
		/**
		 * 自适应缩放
		 */
		public function zoomAuto():void
		{
			hundredPercent();
			if (_bound)
			{
				if (_bound.width / canvas.stage.stageWidth > _bound.height / canvas.stage.stageHeight)
				{
					canvas.scaleX = canvas.scaleY = scale = scale / (_bound.width / canvas.stage.stageWidth);
				}
				else
				{
					canvas.scaleX = canvas.scaleY = scale = scale / (_bound.height / canvas.stage.stageHeight);
				}
				
				canvas.x =(canvas.stage.stageWidth - _bound.width * scale) / 2 - _bound.x * scale;
				canvas.y =(canvas.stage.stageHeight - _bound.height * scale) / 2 - _bound.y * scale;
			}
		}
		
		/**
		 * 百分百
		 * @param bound 画布显示的内容
		 */
		public function hundredPercent():void
		{
			canvas.scaleX = canvas.scaleY = scale = 1;
			if (_bound)
			{
				canvas.x = (canvas.stage.stageWidth - _bound.width) / 2 - _bound.x;
				canvas.y = (canvas.stage.stageHeight - _bound.height) / 2 - _bound.y;
			}
			else
			{
				canvas.x = (canvas.stage.stageWidth - canvas.width) / 2 - canvas.x;
				canvas.y = (canvas.stage.stageHeight - canvas.height) / 2 - canvas.y;
			}
		}
		
		/**
		 * 设置边框
		 * @param value
		 * 
		 */
		public function set bound(value:Rectangle):void 
		{
			_bound = value;
		}
		
	}
}