package components.palette
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import events.ShapeMapperEvent;
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.SkinnableContainer;
	import spark.layouts.HorizontalLayout;
	import spark.layouts.VerticalLayout;
	
	
	[Style(name="vGap", type="Number", inherit="no")]
	[Style(name="hGap", type="Number", inherit="no")]
	[Style(name="btnWidth", type="Number", inherit="no")]
	[Style(name="btnHeight", type="Number", inherit="no")]
	[Event(name="changeColor", type="events.ShapeMapperEvent")]
	public class ColorPalette extends SkinnableContainer
	{
		//预设颜色集
		[Bindable]
		public var colors:Vector.<uint>;
		
		//颜色输入栏
		private var _colorInput:ColorInput;
		
		//颜色值
		private var _colorValue:uint = 0x000000;
		
		[Bindable]
		public function get colorValue():uint
		{
			return _colorValue;
		}
		
		public function set colorValue(value:uint):void
		{
			_colorValue = value;
			invalidateProperties();
		}
		
		//列数量
		[Bindable]
		private var _columNum:uint = 5;

		public function get columNum():uint
		{
			return _columNum;
		}
		
		[Bindable]
		public function set columNum(value:uint):void
		{
			_columNum = value;
			invalidateDisplayList();
		}
		
		public function ColorPalette()
		{
			super();
			
			//设置预设颜色集
			colors = new Vector.<uint>();
			colors.push(0x728F1C);
			colors.push(0xC451C8);
			colors.push(0x097DDA);
			colors.push(0xFE5B3B);
			colors.push(0x5B7C92);
			colors.push(0xAB8718);
			colors.push(0x634BA7);
			colors.push(0xFFFFFF);
			colors.push(0x111111);
			
			setStyle("hGap", 5);
			setStyle("vGap", 5);
			setStyle("btnWidth", 25);
			setStyle("btnHeight", 25);
			
			addEventListener(MouseEvent.CLICK, _mouseClickHandler, false, 0, true);
		}
		
		private function _mouseClickHandler(event:MouseEvent):void
		{
			if(event.target is ColorButton){
				colorValue = ColorButton(event.target).color;
				dispatchEvent(new ShapeMapperEvent(ShapeMapperEvent.CHANGE_COLOR,true));
				_colorInput.value = ColorButton(event.target).color;
			}
		}
		
		override protected function createChildren():void{
			super.createChildren();
			for(var i:uint = 0; i<colors.length; i++){
				var btn:ColorButton = new ColorButton(colors[i]);
				addElement(btn);
			}
			
			_colorInput = new ColorInput();
			addElement(_colorInput);
			
			_colorInput.addEventListener('colorChanged', _colorInputChangeHandler);
		}
		
		private function _colorInputChangeHandler(event:Event):void
		{
			colorValue = _colorInput.value;
			dispatchEvent(new ShapeMapperEvent(ShapeMapperEvent.CHANGE_COLOR,true));
		}
		
		override protected function commitProperties():void{
			super.commitProperties();
			
			//查找颜色按钮，并设置选择状态
			var found:Boolean = false;
			for(var i:int = 0; i<numElements; i++){
				var obj:IVisualElement = getElementAt(i);
				if(obj is ColorButton){
					if(ColorButton(obj).color == _colorValue){
						ColorButton(obj).selected = true;
						found = true;
					}else{
						ColorButton(obj).selected = false;
					}
				}
			}
			
			//在输入栏里填充值
			_colorInput.value = _colorValue;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var _x:Number = 0;
			var _y:Number = 0;
			var _w:Number = 0;
			var _h:Number = 0;
			
			for(var i:uint = 0; i<numElements; i++){
				var obj:IVisualElement = getElementAt(i);
				
				_x = (i % _columNum) * (getStyle("btnWidth") + getStyle("hGap"));
				if( i % _columNum == 0){
					_y = i / _columNum * (getStyle("btnHeight") + getStyle("vGap"));
				}
				_w = getStyle("btnWidth");
				_h = getStyle("btnHeight");
				
				//如果显示对象是颜色输入栏，则重新计算其位置与尺寸
				if(obj is ColorInput){
					var refI:int = _columNum - (i % _columNum);
					_w = refI * getStyle("btnWidth") + (refI - 1) * getStyle("hGap");
					//如果小于颜色输入栏的最小宽度，则换行显示之
					if(_w <= ColorInput(obj).minWidth){
						_w = _columNum * getStyle("btnWidth") + (_columNum - 1) * getStyle("hGap");
						_x = 0;
						_y += getStyle("btnHeight") + getStyle("vGap");
					}
				}
				
				obj.x = _x;
				obj.y = _y;
				obj.width = _w;
				obj.height = _h;
			}
			
			invalidateSize();
		}
	}
}