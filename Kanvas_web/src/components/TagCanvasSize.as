package components
{
	import skins.TagCanvasSizeSkin;
	
	import spark.components.supportClasses.ButtonBase;
	
	public class TagCanvasSize extends ButtonBase
	{
		[Bindable]
		public var widthValue:Number;
		
		[Bindable]
		public var heightValue:Number;
		
		public function TagCanvasSize()
		{
			super();
			setStyle('skinClass', TagCanvasSizeSkin);
		}
	}
}