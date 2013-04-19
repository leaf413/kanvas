package components
{
	import flashx.textLayout.elements.BreakElement;
	
	import mx.states.SetProperty;
	import mx.states.State;
	
	import skins.IconButtonSkin;
	
	import spark.components.supportClasses.ButtonBase;
	import spark.primitives.BitmapImage;
	
	[Style(name="image", inherit="no", type="*")]
	[Style(name="overImage", inherit="no", type="*")]
	[Style(name="downImage", inherit="no", type="*")]
	[Style(name="selectedImage", inherit="no", type="*")]
	public class IconButton extends ButtonBase
	{
		private var _selected:Boolean = false;

		[Bindable]
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
			invalidateSkinState();
		}
		
		public function IconButton()
		{
			super();
			setStyle('skinClass', IconButtonSkin);
		}
		
		override protected function stateChanged(oldState:String, newState:String, recursive:Boolean):void{
			super.stateChanged(oldState, newState, recursive);
			switch(newState){
				case 'over':
					iconDisplay.source = getStyle('overImage');
					break;
				case 'down':
					iconDisplay.source = getStyle('downImage') || (getStyle('selectedImage') || getStyle('image'));
					break;
				default:
					iconDisplay.source = selected ? getStyle('selectedImage') : getStyle('image');
			}
		}
	}
}