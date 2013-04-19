package util
{
	
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import knowledgeMapEditor.controlIcons.icon_info;
	
	import org.osmf.events.TimeEvent;
	
	import util.colorManage.ColorFillVO;
	import util.colorManage.ColorManager;
//	import util.tween.TweenLite;
	
	/**
	 *提示符 
	 * @author work
	 * 
	 */
	public class Prompt extends Sprite
	{
		public function Prompt()
		{
			super();
			promptBg();
			promptTextField();
		}
		
		/**
		 *背景
		 */
		private var bg:Sprite;
		
		/**
		 *宽 
		 */
		private var _bgWidth:Number = 70;
		
		/**
		 *高 
		 */
		private var _bgHeight:Number = 30;
		
		/**
		 * 文本
		 */
		private var textField:TextField;
		
		/**
		 *文字颜色 
		 */
		private var _labelColor:uint = 0xFFFFFF;
		
		/**
		 * 字体
		 */
		private var _labelFont:String = "arial";	
		
		/**
		 * 生存期限
		 */
		private var _survivalPeriod:uint = 300;
		
		/**
		 *计时器 
		 */
		private var time:Timer;
		
		/**
		 * 是否显示
		 */
		private var showing:Boolean = false;
		
		/**
		 *设置位置 
		 * 
		 */
		public  function setPosition(_w:Number, _h:Number):void
		{
			if (isStage)
			{
				this.x = (this.stage.stageWidth - this.bgWidth) / 2;
				this.y = (this.stage.stageHeight - this.bgHeight) / 2;
			}
			else
			{
				this.x = this.stage.mouseX + 15;
				this.y = this.stage.mouseY + 15;
			}
			
		}
		
		/**
		 *缝隙 
		 */
		private var gap:int = 5;
		
		/**
		 *初始化背景
		 * 
		 */
		private function promptBg():void
		{
			if (bg)
			{
				removeChild(bg);
				bg = null;
			}
			
			bg = new icon_info();
			addChild(bg);
			this.alpha = 0;
		}
		
		private function redrawBG():void
		{
			if (bg)
			{
				bg.width = bgWidth;
				bg.height = bgHeight;
			}
		}
		
		private var isStage:Boolean = false;
		
		/**
		 *初始化文字 
		 * 
		 */
		private function promptTextField():void
		{
			textField = new TextField();
			
			var format:TextFormat = new TextFormat();
			format.font = _labelFont;
			format.color = _labelColor;
			if (isStage)
			{
				format.size = 18;
			}
			else
			{
				format.size = 10;
			}
			
			textField.defaultTextFormat = format;
			this.addChild(textField);
		}
		
		public function formatSize():void
		{
			var format:TextFormat = new TextFormat();
			format.font = _labelFont;
			format.color = _labelColor;
			if (isStage)
			{
				format.size = 18;
			}
			else
			{
				format.size = 10;
			}
			
			textField.defaultTextFormat = format;
		}
		
		/**
		 *开始显示 
		 * 
		 */
		public function startShow( _w:Number, _h:Number):void
		{
			setPosition(_w, _h);
			if (time) time.removeEventListener("timer",stopShow);
			time = new Timer(survivalPeriod,1);
			time.addEventListener("timer",stopShow);
//			TweenLite.goto(this,0.8,{alpha:1});
			time.start();
			showing = true;
			
		}
		
		/**
		 */
		public function show(_w:Number, _h:Number):void
		{
			setPosition(_w, _h);
//			TweenLite.goto(this,0.8,{alpha:1});
			showing = true;
		}
		
		/**
		 */
		public function hide():void
		{
//			TweenLite.goto(this,0.2,{alpha:0});
			showing = false;
		}
		
		/**
		 *停止显示 
		 * @param evt
		 * 
		 */
		public function stopShow(evt:TimerEvent):void
		{
			time.removeEventListener("timer",stopShow);
//			TweenLite.goto(this,0.8,{alpha:0});
			showing = false;
		}
		
		
		/**
		 *设置标签文字 
		 * @param str
		 * 
		 */
		public function setLabel(str:String, stage:Boolean):void
		{
			isStage = stage;
			formatSize();
			textField.text = str;
			textField.autoSize = TextFieldAutoSize.LEFT;
			
			
			if (isStage)
			{
				bgWidth = textField.width + gap * 2;
				bgHeight = textField.height + gap * 2;
			}
			else
			{
				bgWidth = textField.width + gap;
				bgHeight = textField.height + gap;
			}
			
			redrawBG();
			textField.x = (bgWidth - textField.width) / 2;
			textField.y = (bgHeight - textField.height) / 2;
		}
		
		public function get bgWidth():Number 
		{
			return _bgWidth;
		}
		
		public function set bgWidth(value:Number):void 
		{
			_bgWidth = value;
		}
		
		public function get bgHeight():Number 
		{
			return _bgHeight;
		}
		
		public function set bgHeight(value:Number):void 
		{
			_bgHeight = value;
		}
		
		public function get labelColor():uint 
		{
			return _labelColor;
		}
		
		public function set labelColor(value:uint):void 
		{
			_labelColor = value;
		}
		
		public function get labelFont():String 
		{
			return _labelFont;
		}
		
		public function set labelFont(value:String):void 
		{
			_labelFont = value;
		}
		
		public function get survivalPeriod():uint 
		{
			if (isStage)
			{
				_survivalPeriod = 1000;
			}
			else
			{
				_survivalPeriod = 300;
			}
			return _survivalPeriod;
		}
		
		public function set survivalPeriod(value:uint):void 
		{
			_survivalPeriod = value;
		}
		
		private static function getColorFill(color:uint, 
											 hightColorRadio:Number = 1.3, 
											 lowColorRadio:Number = 1.0,
											 borderRadio:Number = .9,
											 width:Number = 0,
											 height:Number = 0):ColorFillVO
		{
			var colorStyle:ColorFillVO = new ColorFillVO();
			colorStyle.fillAngle = Math.PI / 2;
			colorStyle.fillColors = [ColorManager.transformColor(color, hightColorRadio, hightColorRadio, hightColorRadio), 
				ColorManager.transformColor(color, lowColorRadio, lowColorRadio, lowColorRadio)];
			
			colorStyle.borderColor = ColorManager.transformColor(color, borderRadio, borderRadio, borderRadio);
			colorStyle.borderAlpha = 1;
			colorStyle.borderThikness = 1;
			
			colorStyle.width = width;
			colorStyle.height = height;
			
			colorStyle.tx = 0;
			colorStyle.ty = 0;
			
			return colorStyle;
		}
	}
}