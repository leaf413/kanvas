package
{
	import controller.event.CanvasEvent;
	import controller.interfaceCommand.CanvasController;
	import controller.interfaceCommand.ElementController;
	import controller.interfaceCommand.OtherController;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import util.StageUtil;
	import util.XMLConfigKit.XMLVOLib;
	import util.XMLConfigKit.XMLVOMapper;
	
	import view.Canvas;
	
	/**
	 * 核心主程序
	 * @author foxm
	 * 
	 */
	[Bindable]
	public class CoreApp extends Sprite
	{
		
		/**
		 * 背景
		 */
		private var bg:Sprite;

		/**
		 * 画布
		 */
		public var canvas:Canvas;
		
		/**
		 * 控制器
		 */
		private var _facade:CoreFacade;
		
		/**
		 * 画布控制器
		 */
		public var canvasController:CanvasController;
		
		/**
		 * 元素控制器
		 */
		public var elementController:ElementController;
		
		/**
		 * 未分类控制
		 */
		public var otherController:OtherController;
		
		/**
		 * 加载配置文件器
		 */
		private var loadConfig:URLLoader;
		
		public function CoreApp()
		{
			super();
			
			init();
		}
		
		public function get facade():CoreFacade
		{
			return _facade;
		}
		
		public function set facade(value:CoreFacade):void
		{
			_facade = value;
		}
		
		/**
		 * 初始化程序
		 */
		private function init():void
		{
			initConfig();
			
			bg = new Sprite();
			this.addChild(bg);

			canvas = new Canvas();
			this.addChild(canvas);
			
			facade = CoreFacade.getInstance();
			facade.startApp(canvas);
			
			elementController = new ElementController(facade);
			canvasController = new CanvasController(facade);
			otherController = new OtherController(facade);
			
			
			
			canvas.addEventListener(CanvasEvent.CHANGE_BG_COLOR, renderBG, false, 0, true);
		}
		
		/**
		 * 初始化载入xml配置文件
		 * 
		 */
		private function initConfig():void
		{
			var request:URLRequest = new URLRequest("Config.xml");
			loadConfig =  new URLLoader();
			loadConfig.load(request);
			loadConfig.addEventListener(Event.COMPLETE, onCompleteLoadConfig);
		}
		
		protected function onCompleteLoadConfig(event:Event):void
		{
			XMLVOLib.clearPartLib();
			var config:XML = XML(event.target.data);
			var configList:XMLList = config.child('elementStyle').children();
			
			for each (var item:XML in config.child('template').children())
				XMLVOLib.registWholeXML(item.@id, item, item.name().toString());
				
			for (var i:int = 0; i < configList.length(); i++) 
			{
				for each (var temp:XML in configList[i].children())
					XMLVOLib.registWholeXML(temp.@id, temp, temp.name().toString());
			}
			
			for each (var item2:XML in config.child('styles').children())
			{
				XMLVOLib.registerPartXML(item2.@id, item2, item2.name().toString());
			}
			
			canvasController.InitStyles(XMLVOLib.getXML('stylesDefault', 'default'));
		}
		
		/**
		 * 获得元素缩放控制器坐标
		 * @return 
		 * 
		 */
		public function get scaleControlPosition():Point 
		{
			var p:Point = new Point();
			if (canvas.currentElement)
			{
				p.x = canvas.x + (canvas.currentElement.x * canvas.scaleX);
				p.y = canvas.y + (canvas.currentElement.y * canvas.scaleX);
			}
			return p;
		}
		
		/**
		 * 获得元素缩放控制器右上坐标
		 * @return 
		 * 
		 */
		public function get scaleControlPositionTopRight():Point 
		{
			var p:Point = new Point();
			if (canvas.currentElement)
			{
				p.x = canvas.currentElement.width * canvas.scaleX;
				p.y = 0;
			}
			return p;
		}
		
		public function get scaleControlPositionBottomLeft():Point 
		{
			var p:Point = new Point();
			if (canvas.currentElement)
			{
				p.x = 0;
				p.y = canvas.currentElement.height * canvas.scaleX;
			}
			return p;
		}
		
		public function get scaleControlPositionBottomRight():Point 
		{
			var p:Point = new Point();
			if (canvas.currentElement)
			{
				p.x = canvas.currentElement.width * canvas.scaleX;
				p.y = canvas.currentElement.height * canvas.scaleX;
			}
			return p;
		}
		
		public function get scaleControlPositionCenter():Point 
		{
			var p:Point = new Point();
			if (canvas.currentElement)
			{
				p.x = canvas.currentElement.width * canvas.scaleX / 2 + canvas.currentElement.x;
				p.y = canvas.currentElement.height * canvas.scaleX / 2 + canvas.currentElement.y;
			}
			return p;
		}
		
		/**
		 * 渲染背景
		 */
		public function renderBG(e:CanvasEvent = null):void
		{
			bg.graphics.clear();
			bg.graphics.beginFill((facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy).canvasColor, 1);
			bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bg.graphics.endFill();
//			canvas.renderBG(stage.stageWidth, stage.stageHeight, (facade.retrieveProxy(ProxyNames.CANVAS) as CanvasProxy).canvasColor);
		}
		
	}
}