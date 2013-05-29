package util
{
	import model.vo.ElementVO;
	import model.vo.GroupVO;
	import model.vo.ImageVO;
	import model.vo.LineVO;
	import model.vo.ShapeVO;
	import model.vo.TextVO;
	
	import view.Element.ElementBase;
	import view.Element.Lines.BrokenLine;
	import view.Element.Lines.Connector;
	import view.Element.Lines.Line;
	import view.Element.Lines.LineBase;
	import view.Element.groups.Group;
	import view.Element.groups.GroupBase;
	import view.Element.groups.MultiSelection;
	import view.Element.images.Image;
	import view.Element.images.ImageBase;
	import view.Element.shapes.Arrow;
	import view.Element.shapes.Circle;
	import view.Element.shapes.DoubleArrow;
	import view.Element.shapes.Hexagon;
	import view.Element.shapes.Polygon;
	import view.Element.shapes.Rect;
	import view.Element.shapes.Star;
	import view.Element.shapes.Trapezoidal;
	import view.Element.shapes.Triangle;
	import view.Element.text.Text;
	
	public class ShapeCreator
	{
		/**
		 */		
		public function ShapeCreator()
		{
			//UI
			ElementBase;
			Triangle;
			Rect;
			Circle;
			Polygon;
			Star;
			
			Trapezoidal;
			Arrow;
			DoubleArrow;
			Hexagon;
			
			Text;
			
			Image;
			ImageBase;
			
			GroupBase;
			Group;
			MultiSelection;
			
			LineBase;
			Line;
			Connector;
			BrokenLine;
			
			ShapeVO;
			ElementVO;
			LineVO;
			GroupVO;
			TextVO;
		}
		
//		/**
//		 */		
		public static function getShapeVO(type:String):ElementVO
		{
			return ClassUtil.getObjectByClassPath(SHAPE_UI_MAP.shape.(@type == type).@voClassPath) as ElementVO;
		}
		
//		/**
//		 */		
//		public static function setShapeSize(shapeVO:ElementVO):void
//		{
//			var shapeXML:XMLList= SHPAE_SIZE_MAP.shape.(@type == shapeVO.type);
//			
//			shapeVO.width = shapeXML.@width;
//			shapeVO.height = shapeXML.@height;
//		}
		
//		public static function setImageSize(shapeVO:ElementVO):void
//		{
//			shapeVO.width = 200;
//			shapeVO.height = 200;
//		}
		
		/**
		 */		
		public static function getShapeUI(shapeVO:ElementVO):ElementBase
		{
			return ClassUtil.getObjectByClassPath(SHAPE_UI_MAP.shape.(@type == shapeVO.type).@uiClassPath, shapeVO) as ElementBase;
		}
		
		/**
		 */		
		private static const SHAPE_UI_MAP:XML = <shapes>
													<shape type="triangle" uiClassPath="view.Element.shapes.Triangle" voClassPath="model.vo.ShapeVO"/>
													<shape type="rect" uiClassPath="view.Element.shapes.Rect" voClassPath="model.vo.ShapeVO"/>
													<shape type="circle" uiClassPath="view.Element.shapes.Circle" voClassPath="model.vo.ShapeVO"/>
													<shape type="polygon" uiClassPath="view.Element.shapes.Polygon" voClassPath="model.vo.ShapeVO"/>
													<shape type="star" uiClassPath="view.Element.shapes.Star" voClassPath="model.vo.ShapeVO"/>
							 						<shape type="text" uiClassPath="view.Element.text.Text" voClassPath="model.vo.TextVO"/>
													<shape type="connector" uiClassPath="view.Element.Lines.Connector" voClassPath="model.vo.LineVO"/>
													<shape type="image" uiClassPath="view.Element.images.Image" voClassPath="model.vo.ImageVO"/>
													<shape type="group" uiClassPath="view.Element.groups.Group" voClassPath="model.vo.GroupVO"/>
													<shape type="multiSelection" uiClassPath="view.Element.groups.MultiSelection" voClassPath="model.vo.GroupVO"/>
													<shape type="line" uiClassPath="view.Element.Lines.Line" voClassPath="model.vo.LineVO"/>
													<shape type="trapezoidal" uiClassPath="view.Element.shapes.Trapezoidal" voClassPath="model.vo.ShapeVO"/>
													<shape type="arrow" uiClassPath="view.Element.shapes.Arrow" voClassPath="model.vo.ShapeVO"/>
													<shape type="doubleArrow" uiClassPath="view.Element.shapes.DoubleArrow" voClassPath="model.vo.ShapeVO"/>
													<shape type="hexagon" uiClassPath="view.Element.shapes.Hexagon" voClassPath="model.vo.ShapeVO"/>
												</shapes>
//		
//		/**
//		 */			
//		private static const SHPAE_SIZE_MAP:XML = <shapes>
//														<shape type="triangle" width="50" height="50" />
//														<shape type="rect" width="50" height="50"/>
//														<shape type="circle" width="50" height="50"/>
//														<shape type="polygon" width="50" height="50"/>
//														<shape type="star" width="50" height="50"/>
//								 						<shape type="text" width="10" height="20"/>
//														<shape type="connector" />
//														<shape type="group" />
//														<shape type="multiSelection" />
//														<shape type="trapezoidal" width="50" height="50"/>
//														<shape type="arrow" width="50" height="50"/>
//														<shape type="doubleArrow" width="50" height="50"/>
//														<shape type="hexagon" width="50" height="50"/>
//														<shape type="line" />
//													</shapes>
//		
//			
		/**
		 */		
		public static var propertiesMap:XML = <shapes>
												<rect id="" x="" y="" width="" height="" label="" color="" property="" styleTempType=""/>
												<circle id=""  x="" y="" width="" height="" label="" color=""  property="" styleTempType=""/>
												<star id=""  x="" y="" width="" height="" label="" color=""   property="" styleTempType=""/>
												<polygon id=""  x="" y="" width="" height="" label="" color=""  property="" styleTempType=""/>
												<text id=""  x="" y="" width="" height="" text=""  color=""  size=""  property="" styleTempType=""/>
												<triangle id=""  x="" y="" width="" height="" label="" color="" property="" styleTempType=""/>
												<connector id=""  startX="" startY="" endX="" endY="" startShapeID="" endShapeID="" color=""  thickness="" property="" styleTempType=""/>
												<image id=""  x="" y="" width="" height="" label="" property="" bitmapID=""  styleTempType=""/>
												<group id=""  x="" y="" width="" height="" label="" color="" styleTempType=""/>
												<tempGroup id=""  x="" y="" width="" height="" styleTempType=""/>
												<trapezoidal id=""  x="" y="" width="" height="" label="" color="" property="" styleTempType=""/>
												<arrow id=""  x="" y="" width="" height="" label="" color="" property="" styleTempType=""/>
												<doubleArrow id=""  x="" y="" width="" height="" label="" color=""  property="" styleTempType=""/>
												<hexagon id=""  x="" y="" width="" height="" label="" color=""   property="" styleTempType=""/>
												<line  id="" startX="" startY="" endX="" endY="" label="" color=""  thickness="" property="" styleTempType=""/>
											</shapes>
				
			
		/**
		 */		
		public static function get shapeID():uint
		{
			return _shapeID ++;
		}
		
		public static function setShapeID(value:uint):void
		{
			_shapeID = value;
		}
		
		/**
		 */		
		private static var _shapeID:uint = 1;
		
		
	}
}