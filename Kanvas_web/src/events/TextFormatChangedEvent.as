package events
{
	import flash.events.Event;
	import flash.text.TextFormat;
	
	/**
	 * @author wallen
	 * 
	 * 字体样式发生改变时，触发此事件。
	 */	
	public class TextFormatChangedEvent extends Event
	{
		public static const FONT_SIZE_CHANGED:String = "fontSizeChanged";
		public static const FONT_BOLD_CHANGED:String = "fontBoldChanged";
		public static const FONT_FAMILY_CHANGED:String = "fontFamilyChanged";
		public static const FONT_ALIGN_CHANGED:String = "fontAlignChanged";
		public static const FONT_ITALIC_CHANGED:String = "fontItalicChanged";
		public static const FONT_UNDERLINE_CHANGED:String = "fontUnderLine";
		
		/**
		 */		
		public function TextFormatChangedEvent(type:String)
		{
			super(type, true);
		}
		
	}
}