package components
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.ui.KeyboardType;
	
	import flashx.textLayout.elements.BreakElement;
	import flashx.textLayout.elements.GlobalSettings;
	
	import events.ShapeMapperEvent;
	import skins.ShapeMapperSkin;
	
	import mx.events.FlexEvent;
	import mx.managers.FocusManager;
	
	import spark.components.Application;
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.ToggleButton;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("normal")]
	[SkinState("editXY")]
	[SkinState("editWidth")]
	[SkinState("editHeight")]
	[Event(name="BgSelect", type="events.ShapeMapperEvent")]
	[Event(name="BorderSelect", type="events.ShapeMapperEvent")]
	[Event(name="SelectNone", type="events.ShapeMapperEvent")]
	[Event(name="changeLock", type="events.ShapeMapperEvent")]
	[Event(name="changeXYMapper", type="events.ShapeMapperEvent")]
	[Event(name="changeWHMaooer", type="events.ShapeMapperEvent")]
	[Event(name="lockMapper", type="events.ShapeMapperEvent")]
	public class ShapeMapper extends SkinnableComponent
	{
		static public const MODE_SHAPE:String = '0';
		
		static public const MODE_IMAGE:String = '1';
		
		[Bindable]
		public var valueX:int = 0;
		
		[Bindable]
		public var valueY:int = 0;
		
		[Bindable]
		public var valueWidth:uint = 0;
		
		[Bindable]
		public var valueHeight:uint = 0;
		
		private var _locked:Boolean = false;
		
		[Bindable]
		public function get locked():Boolean
		{
			return _locked;
		}
		
		public function set locked(value:Boolean):void
		{
			if(_locked == value) return;
			_locked = value;
			invalidateProperties();
			_selectProperty('lock');
		}
		
		private var _mode:String = MODE_SHAPE;
		
		[Bindable]
		public function get mode():String
		{
			return _mode;
		}
		
		public function set mode(value:String):void
		{
			_mode = value;
			invalidateProperties();
		}
		
		private var _selectStatus:String = '';
		
		[Bindable]
		[Inspectable(category="Common", defaultValue="", enumeration="bg, border")]
		public function get selectStatus():String
		{
			return _selectStatus;
		}
		
		public function set selectStatus(value:String):void
		{
			_selectStatus = value;
			invalidateProperties();
		}
		
		[SkinPart(required="true")]
		public var labelXY:Label;
		
		[SkinPart(required="true")]
		public var inputXY:TextInput;
		
		[SkinPart(required="true")]
		public var labelWidth:Label;
		
		[SkinPart(required="true")]
		public var inputWidth:TextInput;
		
		[SkinPart(required="true")]
		public var labelHeight:Label;
		
		[SkinPart(required="true")]
		public var inputHeight:TextInput;
		
		[SkinPart(required="true")]
		public var lockOpenBtn:IconButton;
		
		[SkinPart(required="true")]
		public var lockCloseBtn:IconButton;
		
		[SkinPart(required="true")]
		public var bgSelectBtn:ToggleButton;
		
		[SkinPart(required="true")]
		public var borderSelectBtn:ToggleButton;
		
		public function ShapeMapper()
		{
			super();
			setStyle('skinClass', ShapeMapperSkin);
		}
		
		/**
		 * 还原来常规状态
		 */
		public function toNormalState():void
		{
			if(inputXY && inputXY.visible) _commitXY();
			if(inputWidth && inputWidth.visible) _commitWidth();
			if(inputHeight && inputHeight.visible) _commitHeight();
		}

		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(MouseEvent.CLICK, _eventHandler, false, 0, true);
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			switch(instance){
				case labelXY:
					labelXY.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case inputXY:
					inputXY.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					inputXY.addEventListener(KeyboardEvent.KEY_UP, _keyboardHandler, false, 0, true);
					break;
				case labelWidth:
					labelWidth.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case inputWidth:
					inputWidth.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					inputWidth.addEventListener(KeyboardEvent.KEY_UP, _keyboardHandler, false, 0, true);
					break;
				case labelHeight:
					labelHeight.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case inputHeight:
					inputHeight.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					inputHeight.addEventListener(KeyboardEvent.KEY_UP, _keyboardHandler, false, 0, true);
					break;
				case lockOpenBtn:
					lockOpenBtn.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case lockCloseBtn:
					lockCloseBtn.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case bgSelectBtn:
					bgSelectBtn.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
				case borderSelectBtn:
					borderSelectBtn.addEventListener(MouseEvent.CLICK, _mouseClickEventHandler, false, 0, true);
					break;
			}
		}
		
		private function _keyboardHandler(event:KeyboardEvent):void
		{
			if(event.keyCode != Keyboard.ENTER) return;
			var e:ShapeMapperEvent;
			switch(event.currentTarget){
				case inputXY:
					_commitXY();
					e = new ShapeMapperEvent(ShapeMapperEvent.CHANGE_XY_MAPPER, true);
					dispatchEvent(e);
					break;
				case inputWidth:
					_commitWidth();
					e = new ShapeMapperEvent(ShapeMapperEvent.CHANGE_WH_MAPPER, true);
					dispatchEvent(e);
					break;
				case inputHeight:
					_commitHeight();
					e = new ShapeMapperEvent(ShapeMapperEvent.CHANGE_WH_MAPPER, true);
					dispatchEvent(e);
					break;
			}
		}
		
		private function _eventHandler(event:MouseEvent):void
		{
			toNormalState();
		}
		
		private function _mouseClickEventHandler(event:MouseEvent):void
		{
			switch(event.currentTarget){
				case labelXY:
					skin.setCurrentState('editXY');
					focusManager.setFocus(inputXY);
					event.stopPropagation();
					//_selectProperty('');
					break;
				case inputXY:
					event.stopPropagation();
					//_selectProperty('');
					break;
				case labelWidth:
					skin.setCurrentState('editWidth');
					focusManager.setFocus(inputWidth);
					event.stopPropagation();
					//_selectProperty('');
					break;
				case inputWidth:
					event.stopPropagation();
					//_selectProperty('');
					break;
				case labelHeight:
					skin.setCurrentState('editHeight');
					focusManager.setFocus(inputHeight);
					event.stopPropagation();
					//_selectProperty('');
					break;
				case inputHeight:
					event.stopPropagation();
					//_selectProperty('');
					break;
				
				case borderSelectBtn:
					_selectProperty('border');
					break;
				case bgSelectBtn:
					_selectProperty('bg');
					break;
				case lockOpenBtn:
					_selectProperty('');
					lockOpenBtn.visible = false;
					lockCloseBtn.visible = true;
					_lock(true);
					var e:ShapeMapperEvent = new ShapeMapperEvent(ShapeMapperEvent.LOCK_MAPPER, true);
					dispatchEvent(e);
					break;
				case lockCloseBtn:
					_selectProperty('');
					lockOpenBtn.visible = true;
					lockCloseBtn.visible = false;
					_lock(false);
					break;
			}
		}
		
		private function _selectProperty(name:String = ''):void
		{
			var e:ShapeMapperEvent;
			switch(name){
				case 'bg':
					if(bgSelectBtn.selected){
						e = new ShapeMapperEvent(ShapeMapperEvent.BG_SELECT, true);
						dispatchEvent(e);
						borderSelectBtn.selected = false;
					}else{
						bgSelectBtn.selected = true;
						//e = new ShapeMapperEvent(ShapeMapperEvent.SELECT_NONE, true);
					}
					break;
				
				case 'border':
					if(borderSelectBtn.selected){
						e = new ShapeMapperEvent(ShapeMapperEvent.BORDER_SELECT, true);
						dispatchEvent(e);
						bgSelectBtn.selected = false;
					}else{
						borderSelectBtn.selected = true;
						//e = new ShapeMapperEvent(ShapeMapperEvent.SELECT_NONE, true);
					}
					break;
				
				case 'lock':
					e = new ShapeMapperEvent(ShapeMapperEvent.CHANGE_LOCK, true);
					dispatchEvent(e);
					break;
				default:
					bgSelectBtn.selected = false;
					borderSelectBtn.selected = false;
					e = new ShapeMapperEvent(ShapeMapperEvent.SELECT_NONE, true);
					dispatchEvent(e);
					break;
			}
		}
		
		private function _commitXY():void
		{
			skin.setCurrentState('normal');
			var arr:Array = inputXY.text.split(',');
			var vx:int = parseInt(arr[0]);
			valueX = vx;
			if(arr.length == 1) return;
			var vy:int = parseInt(arr[1]);
			valueY = vy;
		}
		
		private function _commitWidth():void
		{
			skin.setCurrentState('normal');
			var num:int = parseInt(inputWidth.text);
			if(num < 0) return;
			valueWidth = num;
		}
		
		private function _commitHeight():void
		{
			skin.setCurrentState('normal');
			var num:int = parseInt(inputHeight.text);
			if(num < 0) return;
			valueHeight = num;
			
			if(labelHeight){
				//labelHeight.text = String(valueHeight).substr(0, 4);
			}
		}
		
		private function _lock(flag:Boolean):void
		{
			labelXY.enabled = !flag;
			labelXY.mouseEnabled = !flag;
			labelWidth.enabled = !flag;
			labelWidth.mouseEnabled = !flag;
			labelHeight.enabled = !flag;
			labelHeight.mouseEnabled = !flag;
			bgSelectBtn.enabled = !flag;
			borderSelectBtn.enabled = !flag;
			locked = flag;
		}
		
		/*private function _selectNone():void{
			var e:PropertySelectorEvent = new PropertySelectorEvent(PropertySelectorEvent.SELECT_NONE, false);
			dispatchEvent(e);
		}*/
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
		}
		
		override protected function commitProperties():void{
			super.commitProperties();
			
			if(_mode == MODE_IMAGE){
				bgSelectBtn.setStyle("skinClass", skins.ShapeMapperImageBgSelectSkin);
				if(borderSelectBtn && bgSelectBtn){
					/*bgSelectBtn.setStyle('left', 0);
					bgSelectBtn.setStyle('right', 0);
					bgSelectBtn.setStyle('top', 0);
					bgSelectBtn.setStyle('bottom', 0);*/
					//bgSelectBtn.visible = true;
					borderSelectBtn.mouseEnabled = false;
					//borderSelectBtn.selected = false;
				}
			}else{
				bgSelectBtn.setStyle("skinClass", skins.ShapeMapperBgSelectSkin);
				if(borderSelectBtn && bgSelectBtn){
					/*bgSelectBtn.setStyle('left', 9);
					bgSelectBtn.setStyle('right', 9);
					bgSelectBtn.setStyle('top', 9);
					bgSelectBtn.setStyle('bottom', 9);*/
					//bgSelectBtn.visible = true;
					borderSelectBtn.mouseEnabled = true;
				}
			}
			
			lockOpenBtn.visible = !_locked;
			lockCloseBtn.visible = _locked;
			_lock(_locked);
			
			if(!_locked)
			{
				_selectProperty(selectStatus);
			}
			else
			{
				_selectProperty('');
			}
		}
	}
}