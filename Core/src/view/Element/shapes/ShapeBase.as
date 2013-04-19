package view.Element.shapes
{
	import flash.display.Shape;
	
	import model.vo.ShapeVO;
	
	import mx.states.OverrideBase;
	
	import util.colorManage.ColorFillVO;
	import util.colorManage.ColorManager;
	
	import view.Element.ElementBase;
	
	/**
	 * 图形基类
	 * @author foxm
	 * 
	 */
	public class ShapeBase extends ElementBase
	{
		/**
		 * 数据
		 */
//		public var vo:ShapeVO;
		
		/**
		 * 画形状形状用的
		 */
		protected var shape:Shape;
		
		/**
		 * 画边框用的
		 */
		protected var frame:Shape;
		
		public function ShapeBase(vo:ShapeVO)
		{
			super(vo);
			this.vo = vo;
			shape = new Shape();
			frame = new Shape();
			this.addChild(shape);
			this.addChild(frame);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			shape.graphics.clear();
			frame.graphics.clear();
			shape.alpha = (vo as ShapeVO).alpha;
			frame.alpha = (vo as ShapeVO).frameAlpha;
			var colorFillVO:ColorFillVO = getColorFill((vo as ShapeVO), 2, 1.6, 1);
			ColorManager.setFill(shape.graphics, colorFillVO);
			
		}
		
		/**
		 * 颜色管理
		 */		
		private function getColorFill(shapeVO:ShapeVO, 
											 hightColorRadio:Number = 1.3, 
											 lowColorRadio:Number = 1.0,
											 borderRadio:Number = .9):ColorFillVO
		{
			var colorStyle:ColorFillVO = new ColorFillVO();
			colorStyle.fillAngle = Math.PI / 2;
			colorStyle.fillColors = [ColorManager.transformColor(shapeVO.color, hightColorRadio, hightColorRadio, hightColorRadio), 
				ColorManager.transformColor(shapeVO.color, lowColorRadio, lowColorRadio, lowColorRadio)];
			
			colorStyle.borderColor = ColorManager.transformColor(shapeVO.color, borderRadio, borderRadio, borderRadio);
			colorStyle.borderAlpha = 1;
			colorStyle.borderThikness = 1;
			
			colorStyle.width = shapeVO.width;
			colorStyle.height = shapeVO.height;
			
			colorStyle.tx = 0;
			colorStyle.ty = 0;
			
			return colorStyle;
		}
	}
}