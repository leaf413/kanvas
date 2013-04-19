package components
{
	import flashx.textLayout.elements.BreakElement;
	
	import skins.ToolbarButtonSkin;

	public class ToolbarButton extends IconButton
	{
		public function ToolbarButton()
		{
			super();
			setStyle('skinClass', ToolbarButtonSkin);
		}
		
		override protected function getCurrentSkinState():String{
			var newstate:String = super.getCurrentSkinState();
			if(newstate == 'up'){
				return selected ? 'down' : 'up';
			}
			return newstate;
		}
	}
}