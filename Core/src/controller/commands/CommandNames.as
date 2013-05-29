package controller.commands
{
	public class CommandNames
	{
		/**
		 * 改变元素层次
		 */
		public static const ELEMENT_CHANGE_LAYER:String = "elementChangeLayer";
		
		/**
		 * 拷贝元素
		 */
		public static const COPY_ELEMENT:String = "copyElement";
		
		/**
		 * 粘贴元素
		 */
		public static const PASTE_ELEMENT:String = "pasteElement";
		
		/**
		 * 拖动元素
		 */
		public static const DRAG_ELEMENT:String = "dragElement";
		
		/**
		 * 移动元素
		 */
		public static const MOVE_ELEMENT:String = "moveElement";
		
		/**
		 * 元素删除
		 */
		public static const ELEMENT_DELETE:String = "elementDelete";
		
		/**
		 * 元素群组
		 */
		public static const ELEMENT_GROUP:String = "elementGroup";
		
		/**
		 * 解元素群组
		 */
		public static const ELEMENT_UNGROUP:String = "elementUnGroup";
		
		/**
		 * 元素扩展(给知识地图用)
		 */
		public static const ELEMENT_EXTENSION:String = "elementExtension";
		
		/**
		 * 改变元素属性
		 */
		public static const ELEMENT_CHANGE_PROPERTY:String = "elementChangeProperty";
		
		/**
		 * 元素下对齐
		 */
		public static const ELEMENT_ALIGN_BOTTOM:String = "elementAlignBottom";
		
		/**
		 * 元素左对齐
		 */
		public static const ELEMENT_ALIGN_LEFT:String = "elementAlignLeft";
		
		/**
		 * 元素横居中对齐
		 */
		public static const ELEMENT_ALIGN_MIDDLE_HORIZONTAL:String = "elementAlignMiddleHorizontal";
		
		/**
		 * 元素竖居中上对齐
		 */
		public static const ELEMENT_ALIGN_MIDDLE_VERTICAL:String = "elementAlignMiddleVertical";
		
		/**
		 * 元素右对齐
		 */
		public static const ELEMENT_ALIGN_RIGHT:String = "elementAlignRight";
		
		/**
		 * 元素上对齐
		 */
		public static const ELEMENT_ALIGN_TOP:String = "elementAlignTop";
		
		/**
		 * 元素锁定
		 */
		public static const ELEMENT_LOCK:String = "elementLock";
		
		/**
		 * 改变背景颜色
		 */
		public static const BG_CHANGE_COLOR:String = "bgChangeColor";
		
		
		/**
		 * 选择了元素
		 */
		public static const SELECT_ELEMENT:String = "selectElement";
		
		/**
		 * 设置当前元素
		 */
		public static const SET_CURRENT_ELEMENT:String = "setCurrentElement";
		
		/**
		 * 改变成文字模式
		 */
		public static const EXCHANGE_TO_TEXT_MODE:String = "exchangeToTextMode"
		
		/**
		 * 画布缩放
		 */
		public static const ZOOM_CANVAS:String = "zoomCanvas";
		
		/**
		 * 下一步
		 */
		public static const NEXT_CONTROL:String = "nextControl";
		
		/**
		 * 上一步
		 */
		public static const RETURN_CONTROL:String = "returnControl";
		
		
		/**
		 * 导入文件
		 */
		public static const IMPORT_FILE:String = "importFile";
		
		/**
		 * 导出文件
		 */
		public static const EXPORT_FILE:String = "exportFile";
		
		/**
		 * 保存图片
		 */
		public static const SAVE_IMAGE:String = "saveImage";
		
		/**
		 * 插入图片
		 */
		public static const INSERT_IMAGE:String = "insertImage";
		
		/**
		 * 板鼠标状态返回之前前模式
		 */
		public static const RETURN_TO_TIP_ICON:String = "returnToTipIcon";
		
		/**
		 * 鼠标状体切换回选择 
		 */
		public static const SWITCH_TO_SELECTOR_TIP_ICON:String = "switchToSelectorTipIcon";
		
		public static const SWITCH_TO_TEXT_TIP_ICON:String = "switchToTextTipIcon";
		
		// 状态切换
		public static const TIP_LAYER_TO_SELECTED_MODE:String = "tipLayerToSelectedMode";
		public static const TIP_LAYER_TO_SCALED_MODE:String = "tipLayerToScaledMode";
		public static const TIP_LAYER_TO_TEXT_MODE:String = "tipLayerToTextMode";
		public static const TIP_LAYER_TO_CONNECTOR_MODE:String = "tipLayerToConnectorMode";
		public static const TIP_LAYER_TO_MOVE_SCREEN_MODE:String = "tipLayerToScreenMode";
		public static const TIP_LAYER_TO_ZOOM_IN_MODE:String = "tipLayerToZoomInMode";
		public static const TIP_LAYER_TO_TOOM_OUT_MODE:String = "tipLayerToZoomOutMode";
		
		
		/**
		 * 开始移动画布
		 */
		public static const START_MOVE_CANVAS:String = "startMoveCanvas";
		
		/**
		 * 停止移动画布
		 */
		public static const STOP_MOVE_CANVAS:String = "stopMoveCanvas";
		
		/**
		 * 画边框创建形状
		 */
		public static const DRAW_FAME_CREAT_SHAPE:String = "drawFameCreatShape";
		
		/**
		 * 画线
		 */
		public static const DRAW_LINE:String = "drawLine";
		
		/**
		 * 创建形状
		 */
		public static const CREATE_SHAPE:String = "createShape";
		
		/**
		 * 创建图片
		 */
		public static const CREATE_IMAGE:String = "createImage";
		
		/**
		 * 创建群组
		 */
		public static const CREATE_GROUP:String = "createGroup";
		
		/**
		 * 创建线条 
		 */
		public static const CREATE_LINE:String = "createLine";
		
		/**
		 * 创建文本
		 */
		public static const CREATE_TEXT:String = "createText";
		
		/**
		 * 设置元素样式
		 */
		public static const SET_STYLE:String = "setStyle";
		
		/**
		 * 初始化整体样式
		 */
		public static const INIT_CANVAS_STYLE:String = "initCanvasStyle";
		
		/**
		 * 改变整体样式
		 */
		public static const CHANGE_CANVAS_STYLE:String = 'changeCanvasStyle';
		
		/**
		 * 渲染整体
		 */
		public static const RENDER_CANVAS:String = 'renderCanvas';
		
		
		
		public function CommandNames()
		{
		}
	}
}