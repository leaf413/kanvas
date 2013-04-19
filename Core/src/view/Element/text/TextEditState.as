package view.Element.text
{
	import controller.event.ElementEvent;

	public class TextEditState extends TextStateBase
	{
		public function TextEditState()
		{
		}
		
		override public function up(text:Text):void
		{
			
		}
		
		override public function out(text:Text):void
		{
			text.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_OUT_EDIT_TEXT, text));
		}
		
		override public function over(text:Text):void
		{
			text.dispatchEvent(new ElementEvent(ElementEvent.MOUSE_OVER_EDIT_TEXT, text));
		}
		
		override public function down(text:Text):void
		{
			
		}
		
		override public function doubleClick(text:Text):void
		{
			
		}
		
		override public function selected(text:Text):void
		{
			
		}
		
		override public function unSelected(text:Text):void
		{
			text.toTextUsualState();
			
			if (text.stage)
				text.stage.focus = text;
		}
		
		/**
		 */		
		override public function toEdit(text:Text):void
		{
			
		}
		
		override public function toUsual(text:Text):void
		{
			text.toTextUsualState();
		}
		
	}
}