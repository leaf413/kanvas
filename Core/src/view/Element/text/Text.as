package view.Element.text
{
	import controller.event.CanvasEvent;
	import controller.event.ElementEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import model.vo.ElementVO;
	import model.vo.TextVO;
	
	import util.graphic.StyleManager;
	
	import view.Element.ElementBase;
	
	/**
	 * 文本
	 * @author foxm
	 * 
	 */
	public class Text extends ElementBase
	{
		/**
		 * 文本
		 */
		private var labelField:TextField;
		
		/**
		 * 边框
		 */
		private var border:Sprite = new Sprite();
		
		/**
		 * 当前文字状态
		 */
		public var currentTextEditState:TextStateBase;
		
		/**
		 * 默认状态
		 */
		private var usualTextState:TextUsualState;
		
		/**
		 * 编辑状态
		 */
		private var editTextState:TextEditState;
		
		public function Text(vo:ElementVO)
		{
			super(vo);
			initTextField(vo as TextVO);
			drawBG();
		}
		
		/**
		 * 初始化文字
		 */		
		private function initTextField(textVO:TextVO):void
		{
			labelField = new TextField();
			if (stage)
			{
				stage.focus = labelField;
				
			}
			labelField.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
			labelField.mouseEnabled = true;
			labelField.selectable = true;
			labelField.border = false;
			labelField.wordWrap = textVO.wordWrap;
			labelField.type = TextFieldType.INPUT;
			labelField.antiAliasType = flash.text.AntiAliasType.ADVANCED;
			labelField.gridFitType = flash.text.GridFitType.PIXEL;
			labelField.width = 30;
			var textFormat:TextFormat = new TextFormat(textVO.font, textVO.size, textVO.color, textVO.bold, 
				textVO.italic, textVO.underline, null, null, textVO.align,null,null,null,1.5);
			
			labelField.defaultTextFormat = textFormat;
			labelField.autoSize = TextFieldAutoSize.LEFT;
			labelField.multiline = true;
			labelField.addEventListener(Event.CHANGE, upateLabelHandler, false, 0, true);
			labelField.text = textVO.text;
			this.addChild(border);
			this.addChild(labelField);
			
			currentTextEditState = new TextStateBase();
			usualTextState = new TextUsualState();
			editTextState = new TextEditState();
			currentTextEditState = usualTextState;
			drawBorder();
		}
		
		/**
		 * 双击
		 */
		override protected function doubleClickHandler(evt:MouseEvent):void
		{
			evt.stopPropagation();
			currentTextEditState.doubleClick(this);
		}
		
		/**
		 * 按下元素
		 */
		override protected function downHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			
			if (evt.ctrlKey)
			{
				ctrlClickHandler();
			}
			else
			{
				currentTextEditState.down(this);
			}
		}
		
		/**
		 * 鼠标经过文字
		 * @param evt
		 */
		override protected function mouseOverHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			currentTextEditState.over(this);
		}
		
		/**
		 * 
		 * @param evt
		 */
		override protected function mouseOutHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			currentTextEditState.out(this);
		}
		
		/**
		 * 鼠标弹起元素
		 */
		override protected function mouseUpHandler(evt:MouseEvent):void
		{
			if (vo.isLock)
				return;
			evt.stopPropagation();
			currentTextEditState.up(this);
		}
		
		private function focusInHandler(e:FocusEvent):void 
		{
			IME.enabled = true;
		}
		
		/**
		 * 文字进入默认模式 
		 */		
		public function toTextUsualState():void
		{
			currentTextEditState = usualTextState;
			border.visible = false;
			labelField.mouseEnabled = false;
			mouseChildren = false;
			dispatchEvent(new CanvasEvent(CanvasEvent.TEXT_NOT_EDIT_STATE));
			if (stage)
				stage.focus = null;
		}
		
		/**
		 * 文字进入编辑模式
		 */
		public function toTextEditState():void
		{
			currentTextEditState = editTextState;
			border.visible = true;
			labelField.mouseEnabled = true;
			mouseChildren = true;
			dispatchEvent(new CanvasEvent(CanvasEvent.TEXT_IS_EDIT_STATE));
			if (stage)
				stage.focus = labelField;
		}
		
		/**
		 * 进入选中状态
		 */
		override public function toUnSelectedState():void
		{
			super.toUnSelectedState();
			toTextUsualState();
		}
		
		
		/**
		 * 更新文字
		 * @param evt
		 * 
		 */
		private function upateLabelHandler(evt:Event):void
		{
			var startIndex:int = labelField.text.length - 4;
			var endIndex:int = labelField.text.length - 1;
			var spaceString:String = labelField.text.slice(startIndex,endIndex);
			if (spaceString == " ")
			{
				(vo as TextVO).text = labelField.text.slice(0,labelField.text.length - 4);
				labelField.text = (vo as TextVO).text;
			}
			else
			{
				(vo as TextVO).text = labelField.text;
			}
			updateFontSize();
		}
		
		/**
		 * 更新文字大小
		 */
		private function updateFontSize():void
		{
			(vo as TextVO).width = labelField.width;
			(vo as TextVO).height = labelField.height;
			drawBorder();
			drawBG();
			dispatchEvent(new ElementEvent(ElementEvent.UPDATE_SIZE_AND_POSITION));
		}
		
		/**
		 * 画边框
		 */
		private function drawBorder():void
		{
			if (vo.width < 20)
			{
				vo.width = 20;
			}
			border.graphics.clear();
			border.graphics.beginFill(0, 0);
			border.graphics.lineStyle(0,0xababab, 0.5);
			border.graphics.drawRect(0, 0, vo.width, vo.height);
			border.graphics.endFill();
		}
		
		/**
		 * 渲染文字
		 */
		override public function render():void
		{
			super.render();
			this.alpha = vo.alpha;
//			StyleManager.setLabelUIText(this, (this.vo as TextVO));
//			StyleManager.setShapeStyle(vo.style, graphics, vo);
//			var textFormat:TextFormat = labelField.getTextFormat();
//			textFormat.color = (vo as TextVO).color;
//			textFormat.bold = (vo as TextVO).bold;
//			textFormat.align = (vo as TextVO).align;
//			textFormat.font = (vo as TextVO).font;
//			textFormat.size = (vo as TextVO).size;
//			textFormat.italic = (vo as TextVO).italic;
//			textFormat.underline = (vo as TextVO).underline;
			labelField.text = (vo as TextVO).text;
			labelField.defaultTextFormat = (vo as TextVO).label.getTextFormat(this.vo as TextVO);
			StyleManager.setEffects(this, (vo as TextVO).label);
			updateFontSize();
			changeRecord();
		}
	}
}