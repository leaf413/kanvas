package view.Element.shapes
{
	import model.vo.ShapeVO;
	
	/**
	 * 三角形
	 * @author foxm
	 * 
	 */
	public class Triangle extends ShapeBase
	{
		public function Triangle(vo:ShapeVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			
			var startX:Number = vo.width / 2 ;
			var startY:Number = vo.height / 2 ;
			
			shape.graphics.moveTo(startX, startY - vo.height / 2 );
			shape.graphics.lineTo(startX - vo.width / 2 , startY + vo.height / 2 );
			shape.graphics.lineTo(startX + vo.width / 2 , startY + vo.height / 2 );
			shape.graphics.lineTo(startX , startY - vo.height / 2 );
			shape.graphics.endFill();
			
			frame.graphics.lineStyle((vo as ShapeVO).thickness, (vo as ShapeVO).frameColor, (vo as ShapeVO).frameAlpha);
			frame.graphics.moveTo(startX, startY - vo.height / 2 );
			frame.graphics.lineTo(startX - vo.width / 2 , startY + vo.height / 2 );
			frame.graphics.lineTo(startX + vo.width / 2 , startY + vo.height / 2 );
			frame.graphics.lineTo(startX , startY - vo.height / 2 );
			frame.graphics.endFill();
		}
	}
}