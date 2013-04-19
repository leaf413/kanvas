package components.palette
{
	import flash.events.MouseEvent;
	
	import skins.ColorButtonSkin;
	
	import spark.components.supportClasses.ButtonBase;
	
	public class ColorButton extends ButtonBase
	{
		[Bindable]
		public var color:uint;
		
		[Bindable]
		public var selected:Boolean = false;
		
		public function ColorButton(color:uint = 0xFFFFFF)
		{
			super();
			this.color = color;
			setStyle("skinClass", ColorButtonSkin);
		}
	}
}