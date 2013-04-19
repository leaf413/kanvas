package components.palette
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import flashx.textLayout.elements.BreakElement;
	
	import components.IconButton;
	import skins.ColorInputSkin;
	
	import spark.components.Button;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;
	
	import util.colorManage.ColorRGB;
	
	[Event(name="colorChanged", type="flash.events.Event")]
	public class ColorInput extends SkinnableComponent
	{
		private var _value:uint = 0x000000;
		
		[Bindable(event="colorChanged")]
		public function get value():uint
		{
			return _value;
		}
		public function set value(value:uint):void
		{
			_value = value;
			valueInput.text = new ColorRGB(value).cStrH.toUpperCase();
		}
		
		[SkinPart(required="true")]
		public var valueInput:TextInput;
		
		[SkinPart(required="true")]
		public var submitBtn:IconButton;
		
		public function ColorInput()
		{
			super();
			minWidth = 100;
			setStyle("skinClass", ColorInputSkin);
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(KeyboardEvent.KEY_UP, _keyHandler, false, 0, true);
		}
		
		private function _keyHandler(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.ENTER){
				_submit();
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			switch(instance){
				case valueInput:
					break;
				case submitBtn:
					submitBtn.addEventListener(MouseEvent.CLICK, _submitBtnHandler, false, 0, true);
					break;
			}
			
			super.partAdded(partName, instance);
		}
		
		private function _submitBtnHandler(event:MouseEvent):void
		{
			_submit();
		}
		
		private function _submit():void{
			var colorObj:ColorRGB = new ColorRGB(valueInput.text);
			value = colorObj.cInt;
			valueInput.text = new ColorRGB(value).cStrH.toUpperCase();
			
			var e:Event = new Event('colorChanged');
			dispatchEvent(e);
		}
	}
}