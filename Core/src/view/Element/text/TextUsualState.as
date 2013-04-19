package view.Element.text
{
	import controller.event.ElementEvent;

	/**
	 */	
	public class TextUsualState extends TextStateBase
	{
		public function TextUsualState()
		{
		}
		
		override public function up(text:Text):void
		{
			text.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_UP, text));
		}
		
		override public function down(text:Text):void
		{
			text.toSelectedState();
			text.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_DOWN, text));
		}
		
		override public function doubleClick(text:Text):void
		{
			text.toTextEditState();
		}
		
		override public function selected(text:Text):void
		{
//			text.toTextUsualState();
		}
		
		override public function unSelected(text:Text):void
		{
//			text.toUnSelectedState();
//			text.toTextUsualState();
		}
		
		/**
		 */		
		override public function toEdit(text:Text):void
		{
			text.toTextEditState();
		}
		
		override public function toUsual(text:Text):void
		{
			
		}
		
	}
}