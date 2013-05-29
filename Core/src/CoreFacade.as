package
{
	import controller.commands.CommandNames;
	import controller.commands.ElementController.ChangeElementLayer;
	import controller.commands.ElementController.ChangeElementProterty;
	import controller.commands.ElementController.CopyElement;
	import controller.commands.ElementController.DeleteElement;
	import controller.commands.ElementController.DragElement;
	import controller.commands.ElementController.ElementLock;
	import controller.commands.ElementController.MoveElement;
	import controller.commands.ElementController.PasteElement;
	import controller.commands.ElementController.SetCurrentElement;
	import controller.commands.ElementController.SetStyle;
	import controller.commands.ElementController.creatAndDelete.CreateGroup;
	import controller.commands.ElementController.creatAndDelete.CreateImage;
	import controller.commands.ElementController.creatAndDelete.CreateLine;
	import controller.commands.ElementController.creatAndDelete.CreateShape;
	import controller.commands.ElementController.creatAndDelete.CreateText;
	import controller.commands.canvasController.ChangeBGColor;
	import controller.commands.canvasController.ChangeStyle;
	import controller.commands.canvasController.DrawFame;
	import controller.commands.canvasController.DrawLine;
	import controller.commands.canvasController.InitStyles;
	import controller.commands.canvasController.RenderCanvas;
	import controller.commands.canvasController.StartDragCanvas;
	import controller.commands.canvasController.StopDragCanvas;
	import controller.commands.canvasController.ZoomCanvas;
	import controller.commands.toolController.ExportFile;
	import controller.commands.toolController.ImportFile;
	import controller.commands.toolController.InserImage;
	import controller.commands.toolController.NextControl;
	import controller.commands.toolController.ReturnControl;
	
	import model.CanvasProxy;
	import model.ProxyNames;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import spark.effects.CrossFade;
	
	import view.Canvas;
	import view.CanvasMediator;
	import view.MediatorNames;
	
	/**
	 * MVC注册器
	 * @author foxm
	 * 
	 */
	public class CoreFacade extends Facade
	{
		/**
		 * 单例
		 */
		private static var _instance:CoreFacade;
		
		public function CoreFacade()
		{
			super();
			
			initCommands();
		}
		
		/**
		 * 获取单例
		 */
		public static function getInstance():CoreFacade
		{
			if (_instance == null)
				_instance = new CoreFacade();
			return _instance as CoreFacade;
		}
		
		/**
		 * 启动APP
		 */
		public function startApp(main:Canvas):void
		{
			registerMediator(new CanvasMediator(MediatorNames.CANVAS, main));
			registerProxy(new CanvasProxy(ProxyNames.CANVAS, main));
		}
		
		/**
		 * 初始化命令
		 */
		private function initCommands():void
		{
			///////////////////////////////////
			///          舞台控制命令
			///////////////////////////////////
			
			registerCommand(CommandNames.DRAW_FAME_CREAT_SHAPE, DrawFame);
			registerCommand(CommandNames.DRAW_LINE, DrawLine);
			registerCommand(CommandNames.ZOOM_CANVAS, ZoomCanvas);
			registerCommand(CommandNames.START_MOVE_CANVAS, StartDragCanvas);
			registerCommand(CommandNames.STOP_MOVE_CANVAS, StopDragCanvas);
			registerCommand(CommandNames.BG_CHANGE_COLOR, ChangeBGColor);
			registerCommand(CommandNames.RENDER_CANVAS, RenderCanvas);
			///////////////////////////////////
			///          元素控制命令
			///////////////////////////////////
			registerCommand(CommandNames.COPY_ELEMENT, CopyElement);
			registerCommand(CommandNames.PASTE_ELEMENT, PasteElement);
			registerCommand(CommandNames.DRAG_ELEMENT, DragElement);
			registerCommand(CommandNames.MOVE_ELEMENT, MoveElement);
			registerCommand(CommandNames.ELEMENT_CHANGE_PROPERTY, ChangeElementProterty);
			registerCommand(CommandNames.ELEMENT_LOCK, ElementLock);
			registerCommand(CommandNames.ELEMENT_CHANGE_LAYER, ChangeElementLayer);
			
			//创建
			registerCommand(CommandNames.CREATE_SHAPE, CreateShape);
			registerCommand(CommandNames.CREATE_IMAGE, CreateImage);
			registerCommand(CommandNames.CREATE_GROUP, CreateGroup);
			registerCommand(CommandNames.CREATE_LINE, CreateLine);
			registerCommand(CommandNames.CREATE_TEXT, CreateText);
			
			registerCommand(CommandNames.ELEMENT_DELETE, DeleteElement);
			
			registerCommand(CommandNames.SET_CURRENT_ELEMENT, SetCurrentElement);
			
			///////////////////////////////////
			///          工具栏控制命令
			///////////////////////////////////
			registerCommand(CommandNames.INSERT_IMAGE, InserImage);
			registerCommand(CommandNames.NEXT_CONTROL, NextControl);
			registerCommand(CommandNames.RETURN_CONTROL, ReturnControl);
			registerCommand(CommandNames.IMPORT_FILE, ImportFile);
			registerCommand(CommandNames.EXPORT_FILE, ExportFile);
			///////////////////////////////////
			///          样式控制命令
			///////////////////////////////////
			registerCommand(CommandNames.INIT_CANVAS_STYLE, InitStyles);
			registerCommand(CommandNames.CHANGE_CANVAS_STYLE, ChangeStyle);
			registerCommand(CommandNames.SET_STYLE, SetStyle);
		}
	}
}