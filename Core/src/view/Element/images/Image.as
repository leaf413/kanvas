package view.Element.images
{
	import flash.display.Bitmap;
	
	import model.vo.ImageVO;
	
	/**
	 * 图片
	 * @author foxm
	 * 
	 */
	public class Image extends ImageBase
	{
		public function Image(vo:ImageVO)
		{
			super(vo);
		}
		
		/**
		 * 渲染
		 */
		override public function render():void
		{
			super.render();
			this.alpha = this.alpha;
			var bitmap:Bitmap = (vo as ImageVO).getBitmap;
			this.addChild(bitmap);
			this.width = vo.width;
			this.height = vo.height;
		}
	}
}