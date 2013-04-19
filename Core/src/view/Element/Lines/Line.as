package view.Element.Lines
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import model.vo.LineVO;
	
	/**
	 * 线条
	 * @author foxm
	 * 
	 */
	public class Line extends LineBase
	{
		/**
		 * 开始点箭头
		 */
		private var startArrow:Sprite;
		
		/**
		 * 结束点箭头
		 */
		private var endArrow:Sprite;
		
		/**
		 * 箭头大小
		 */
		private var arrowValue:int = 2;
		
		public function Line(vo:LineVO)
		{
			startArrow = new Sprite();
			endArrow = new Sprite();
			super(vo);
			addChild(startArrow);
			addChild(endArrow);
			startArrow.visible = vo.startArrow;
			endArrow.visible = vo.endArrow;
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			line.graphics.clear();
			line.graphics.lineStyle((vo as LineVO).thickness, (vo as LineVO).color, (vo as LineVO).alpha);
			
			if ((vo as LineVO).startPoint.x < (vo as LineVO).endPoint.x)
			{
				line.graphics.moveTo(startXY.x, startXY.y);
				line.graphics.lineTo(endXY.x, endXY.y);
			}
			else
			{
				line.graphics.moveTo(endXY.x, endXY.y);
				line.graphics.lineTo(startXY.x, startXY.y);
			}
			
			line.graphics.endFill();
			drawStartArrow();
			drawEndArrow();
			arrowUpdate();
		}
		
		override public function moveTo(value:Point):void
		{
			(vo as LineVO).startPoint.x += value.x - this.x;
			(vo as LineVO).startPoint.y += value.y - this.y;
			(vo as LineVO).endPoint.x += value.x - this.x;
			(vo as LineVO).endPoint.y += value.y - this.y;
			super.moveTo(value);
		}
		
		/**
		 * 更新布局
		 */
		override public function updateLayout():void
		{
			if ((vo as LineVO).startPoint.x < (vo as LineVO).endPoint.x)
			{
				this.x = (vo as LineVO).startPoint.x;
			}
			else
			{
				this.x = (vo as LineVO).endPoint.x;
			}
			
			if ((vo as LineVO).startPoint.y < (vo as LineVO).endPoint.y)
			{
				this.y = (vo as LineVO).startPoint.y;
			}
			else
			{
				this.y = (vo as LineVO).endPoint.y;
			}
		}
		
		/**
		 * 箭头更新
		 */
		public function arrowUpdate():void
		{
			startArrow.visible = (vo as LineVO).startArrow;
			endArrow.visible = (vo as LineVO).endArrow;
		}
		
		/**
		 * 显示开始点箭头
		 */
		public function showStartArrow():void
		{
			startArrow.visible = true;
		}
		
		/**
		 * 隐藏开始点箭头
		 */
		public function hideStartArrow():void
		{
			startArrow.visible = false;
		}
		
		/**
		 * 显示结束点箭头
		 */
		public function showEndArrow():void
		{
			endArrow.visible = true;
		}
		
		/**
		 * 隐藏结束点箭头
		 */
		public function hideEndArrow():void
		{
			endArrow.visible = false;
		}
		
		/**
		 * 画开始箭头
		 */
		private function drawStartArrow():void
		{
			startArrow.graphics.clear();
			startArrow.graphics.beginFill((vo as LineVO).color);
			startArrow.graphics.moveTo((0 + arrowValue) * (vo as LineVO).thickness, 0  * (vo as LineVO).thickness);
			startArrow.graphics.lineTo((- 10 + arrowValue) * (vo as LineVO).thickness, -5 * (vo as LineVO).thickness);
			startArrow.graphics.lineTo((-10 + arrowValue) * (vo as LineVO).thickness, 5  * (vo as LineVO).thickness);
			startArrow.graphics.lineTo((0 + arrowValue) * (vo as LineVO).thickness, 0 * (vo as LineVO).thickness);
			startArrow.graphics.endFill();
			startArrow.x = startXY.x;
			startArrow.y = startXY.y;
			var f:Number = ((vo as LineVO).endPoint.y - (vo as LineVO).startPoint.y) / ((vo as LineVO).endPoint.x - (vo as LineVO).startPoint.x);
			var angle:Number = Math.atan(f) * 180 / Math.PI;
			if((vo as LineVO).endPoint.x >= (vo as LineVO).startPoint.x)
			{
				angle-=180;
			}
			startArrow.rotation=angle;
		}
		
		/**
		 * 画结束箭头
		 */
		private function drawEndArrow():void
		{
			endArrow.graphics.clear();
			endArrow.graphics.beginFill((vo as LineVO).color);
			endArrow.graphics.moveTo((0 + arrowValue) * (vo as LineVO).thickness, 0 * (vo as LineVO).thickness);
			endArrow.graphics.lineTo((- 10 + arrowValue) * (vo as LineVO).thickness, - 5 * (vo as LineVO).thickness);
			endArrow.graphics.lineTo((- 10 + arrowValue) * (vo as LineVO).thickness, 5  * (vo as LineVO).thickness);
			endArrow.graphics.lineTo((0 + arrowValue) * (vo as LineVO).thickness, 0 * (vo as LineVO).thickness);
			endArrow.graphics.endFill();
			endArrow.x = endXY.x;
			endArrow.y = endXY.y;
			var f:Number = ((vo as LineVO).startPoint.y - (vo as LineVO).endPoint.y) / ((vo as LineVO).startPoint.x - (vo as LineVO).endPoint.x);
			var angle:Number = Math.atan(f) * 180 / Math.PI;
			if((vo as LineVO).endPoint.x <= (vo as LineVO).startPoint.x)
			{
				angle-=180;
			}
			endArrow.rotation=angle;
		}
		
		/**
		 * 画背景
		 */
		override public function drawBG():void
		{
			bg.graphics.clear();
			bg.graphics.lineStyle((vo as LineVO).thickness + 10, 0xe0e0e0, 0.5);
			if ((vo as LineVO).startPoint.x < (vo as LineVO).endPoint.x)
			{
				bg.graphics.moveTo(startXY.x, startXY.y);
				bg.graphics.lineTo(endXY.x, endXY.y);
			}
			else
			{
				bg.graphics.moveTo(endXY.x, endXY.y);
				bg.graphics.lineTo(startXY.x, startXY.y);
			}
			bg.graphics.endFill();
		}
		
		private function get startXY():Point 
		{
			return new Point((vo as LineVO).startPoint.x - x, (vo as LineVO).startPoint.y - y);
		}
		
		private function get endXY():Point 
		{
			return new Point((vo as LineVO).endPoint.x - x, (vo as LineVO).endPoint.y - y);
		}
	}
}