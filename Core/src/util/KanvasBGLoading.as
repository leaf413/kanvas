package util
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	
	/**
	 *知识管理地图与预览地图背景的加载控制 
	**/
	public class KanvasBGLoading extends Sprite
	{
		public function KanvasBGLoading()
		{
			loadingImage = new LoadingImage()
			loadingImage.mouseChildren = false;
			loadingImage.mouseEnabled = false;
			loadingImage.alpha = 0;
			addChild(loadingImage);
		}
		
		/**
		 */
		public function show():void
		{ 
			TweenLite.to(loadingImage, .3, {alpha: 1});
		}
		
		/**
		 */		
		public function hide():void
		{
			TweenLite.to(loadingImage, .3, {alpha: 0});
		}
		
		/**
		 */		
		private var loadingImage:Sprite;
	}
}