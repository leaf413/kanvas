package ui
{
	import com.landray.kPlayer.assets.ToolTip;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 信息提示
	 * @author foxm
	 * 
	 */
	public class KPlayToolTip extends Sprite
	{
		public function KPlayToolTip()
		{
			super();
			inittextField();
		}
		
		/**
		 * 初始化文字
		 */
		private function inittextField():void
		{
			this.mouseChildren = false;
			
			tooltip = new ToolTip();
			addChild(tooltip);
			
			textField = new TextField();
			textField.text = label;
			textField.mouseEnabled = false;
			textField.selectable = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.antiAliasType = flash.text.AntiAliasType.ADVANCED;
			var textformat:TextFormat = new TextFormat("SimSun", 12, 0x353535);
			textField.defaultTextFormat = textformat;
			textField.width = textField.textWidth;
			textField.height = textField.textHeight;
			addChild(textField);
			upDataSize();
		}
		
		private function upDataSize():void
		{
			tooltip.width = textField.width + 6;
			textFieldToCenter();
		}
		
		private function textFieldToCenter():void
		{
			textField.x = (this.width - textField.width) / 2;
			textField.y = (this.height - textField.height) / 2 + 2;
		}
		
		public function upDataPoinstion():void
		{
			this.x = this.stage.mouseX;
			this.y = this.stage.mouseY + 20;
		}
		
		/**
		 * 刷新文字
		 */
		private function formatText():void
		{
			textField.text = label;
		}
		
		private var _label:String = "信息文字";
		
		/**
		 * 信息文字
		 */
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
			formatText();
			upDataSize();
		}
		
		private var tooltip:ToolTip;
		
		private var textField:TextField;
	}
}