package events
{
	import flash.events.Event;
	
	import view.Element.ElementBase;
	
	/**
	 * 属性面板事件类
	 * @author foxm
	 * 
	 */
	public class PropertyPanelEvent extends Event
	{
		/**
		 * 快速复制
		 */
		public static const NORMAL_DUPLICATE:String = "noramlDuplicate";
		
		/**
		 * 删除
		 */
		public static const NORMAL_DELETE:String = "normalDelete";
		
		/**
		 * 移至最上一层
		 */
		public static const NORMAL_TOP_LAYER:String = "normalTopLayer";
		
		/**
		 * 移至最下一层
		 */
		public static const NORMAL_BOTTOM_LAYER:String = "normalBottomLayer";
		
		/**
		 * 群组
		 */
		public static const NORMAL_GROUP:String = "normalGroup";
		
		/**
		 * 解群组
		 */
		public static const NORMAL_UNGROUP:String = "normalUnGroup";
		
		/**
		 * 扩展
		 */
		public static const NORMAL_EXTENSION:String = "normalExtension";
		
		/**
		 * 元素位置更改
		 */
		public static const SHAPE_POSITION_CHANGED:String = "shapePositionChange";
		
		/**
		 * 元素大小更改
		 */
		public static const SHAPE_SIZE_CHANGED:String = "shapeSizeChange";
		
		/**
		 * 改变透明度
		 */
		public static const SHAPE_ALPHA_CHANGED:String = "shapeAlphaChange";
		
		/**
		 * 改变线条透明度
		 */
		public static const SHAPE_LINE_ALPHA_CHANGED:String = "shapeLinealphaChange";
		
		/**
		 * 改变颜色
		 */
		public static const SHAPE_COLOR_CHANGE:String = "shapeColorChange";
		
		/**
		 * 改变线条颜色
		 */
		public static const SHAPE_LINE_COLOR_CHANGE:String = "shapelineColorChange";
		
		/**
		 * 改变边框粗细
		 */
		public static const SHAPE_THICKNESS_CHANGE:String = "shapeThicknessChange";
		
		/**
		 * 改变线条样式
		 */
		public static const LINE_STYLE_CHANGE:String = "lineStyleChange";
		
		/**
		 * 改变角度
		 */
		public static const SHAPE_ROTATION_CHANGE:String = "shapeRotationChange";
		
		/**
		 * 改变锁定状态
		 */
		public static const SHAPE_LOCK_CHANGE:String = "shapeLockChange";
		
		/**
		 * 箭头改变
		 */
		public static const SHAPE_ARROW_CHANGE:String = "shapeArrowChange";
		
		
		/**
		 * 
		 */
		public static const SHAPEVO_RECORD:String = "shapeVORecord";
		
		/**
		 * 解锁
		 */
		public static const UNLOCK_TO_SHAPE:String = "unLockToShape";
		
		/**
		 * 锁定
		 */
		public static const LOCK:String = "lock";
		
		/**
		 * 改变坐标
		 */
		public static const CHANGE_XY:String = "changeXY";
		
		/**
		 * 改变宽高
		 */
		public static const CHANGE_WH:String = "changeWH";
		
		/**
		 * 改变图片XY
		 */
		public static const CHANGE_IMAGE_XY:String = "changeImageXY";
		
		/**
		 * 改变图片宽高
		 */
		public static const CHANGE_IMAGE_WH:String = "changeImageWH";
		
		/**
		 * 改变元素颜色
		 */
		public static const CHANGE_PROPERTY_SHAPE_COLOR:String = "changePropertyShapeColor";
		
		/**
		 * 改变线条颜色
		 */
		public static const CHANGE_PROPERTY_SHAPE_LINE_COLOR:String = "changePropertyShapeLineColor";
		
		/**
		 * 改变箭头
		 */
		public static const CHANGE_ARROW:String = "changeArrow";
		
		/**
		 * 改变透明度
		 */
		public static const CHANGE_ALPHA_SHAPE:String = "changeAlphaShape";
		
		/**
		 * 改变边框透明度
		 */
		public static const CHANGE_ALPHA_SHAPE_LINE:String = "changeAlphaShapeLine";
		
		/**
		 * 改变线条粗细
		 */
		public static const CHANGE_THICKNESS:String = "changeThickness";
		
		/**
		 * 上对齐
		 */
		public static const SHAPE_ALIGN_TOP:String = "shapeAlignTop"
		
		/**
		 * 横向居中对齐
		 */
		public static const SHAPE_ALIGN_MIDDLE_H:String = "shapeAlignMiddleH";
		
		/**
		 * 下对齐
		 */
		public static const SHAPE_ALIGN_BOTTOM:String = "shapeAlignBottom";
		
		/**
		 * 左对齐
		 */
		public static const SHAPE_ALIGN_LEFT:String = "shapeAlignLeft";
		
		/**
		 * 纵向居中对齐
		 */
		public static const SHAPE_ALIGN_MIDDLE_V:String = "shapeAlignMiddleV";
	
		/**
		 * 右对齐
		 */
		public static const SHAPE_ALIGN_RIGHT:String = "shapeAlignRight";
		
		/**
		 * 背景颜色改变
		 */
		public static const CHANGE_BG_COLOR:String = "changeBGColor";
		
		/**
		 * 属性面板的状态切换
		 */
		public static const PROPERTY_TO_STAGE:String = "PropertyToStage";
		public static const PROPERTY_TO_SHAPE:String = "PropertyToShape";
		public static const PROPERTY_TO_TEXT:String = "PropertyToText";
		public static const PROPERTY_TO_CONNECT:String = "PropertyToConnect";
		public static const PROPERTY_TO_IMAGE:String = "PropertyToImage";
		public static const PROPERTY_TO_GROUP:String = "PropertyToGroup";
		public static const PROPERTY_TO_TEMPGROUP:String = "PropertyToTempGroup";
		public static const PROPERTY_TO_TEMPGROUP_LINE:String = "PropertyToTempGroupLine";
		public static const PROPERTY_TO_TEMPGROUP_TEXT:String = "PropertyToTempGroupText";
		
		public function PropertyPanelEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var element:ElementBase;
	}
}