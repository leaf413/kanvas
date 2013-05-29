package model
{
	import model.vo.ElementVO;
	import model.vo.ShapeVO;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import util.RenturnAndNext;
	import util.ShapeCreator;
	import util.ShapeVORecord;
	import util.XMLConfigKit.StyleTemplet;
	import util.XMLConfigKit.XMLVOLib;
	import util.XMLConfigKit.XMLVOMapper;
	import util.XMLConfigKit.style.Style;
	import util.lib.ImageLib;
	import util.type.ElementTypes;
	
	/**
	 * 画布模型
	 * @author foxm
	 * 
	 */
	public class CanvasProxy extends Proxy
	{
		/**
		 * 元素样式
		 */
		public var style:StyleTemplet = new StyleTemplet();
		
		/**
		 * 画布颜色
		 */
		public var canvasColor:uint = 0xffffff;
		
		/**
		 * 保留上次属性设置
		 */
		public var shapeVORecord:ShapeVORecord = new ShapeVORecord();
		
		/**
		 * 当前元素VO
		 */
		private var _currentElementVO:ElementVO;
		
		/**
		 * 所有元素VO
		 */
		private var _allElementVOes:Vector.<ElementVO> = new Vector.<ElementVO>();
		
		/**
		 *存放图片库 
		 */
		public var imageMap:ImageLib = new ImageLib();
		
		
		/**
		 * 存放将要拷贝的形状
		 */
		public var copyMap:ElementVO;
		
		/**
		 * 前进返回控制
		 */
		public var renturnAndNext:RenturnAndNext = new RenturnAndNext();
		
		public function CanvasProxy(proxyName:String = null, data:Object = null)
		{
			super(proxyName, data);
		}
		
		/**
		 * 添加元素
		 * @param value
		 */
		public function addElement(value:ElementVO):void
		{
			allElementVOes.push(value);
		}
		
		/**
		 * 删除元素
		 * @param value
		 * 
		 */
		public function deleteElement(value:ElementVO):void
		{
			try
			{
				var index:int = allElementVOes.indexOf(value);
				if (index != -1)
				{
					allElementVOes.splice(index, 1);
				}
				
				
			}
			catch (err:Error)
			{
				trace("EditorFieldProxy->deleteShap" + err);
			}
		}
		
		/**
		 *删除所有元素 
		 * 
		 */
		public function removeAllShape():void
		{
			this.allElementVOes = null;
			this.allElementVOes = new Vector.<ElementVO>;
		}
		
		/**
		 * 设置所有元素
		 * @param value
		 */
		public function set allElementVOes(value:Vector.<ElementVO>):void 
		{
			_allElementVOes = value;
		}
		
		/**
		 * 获取所有元素
		 * @return 
		 */
		public function get allElementVOes():Vector.<ElementVO> 
		{
			return _allElementVOes;
		}
		
		public function voToXML(vo:ElementVO):XML
		{
			var xml:XML = XML(ShapeCreator.propertiesMap[vo.type]).copy();
			return xml;
		}
		
		
		/**
		 * 得到数据
		 * @return 
		 * 
		 */
		public function getAllData():XML
		{
			var xml:XML = <canvasData>
							<header version = 'kanvas_2.0'>
								<blackground color='0xffffff' image='' style=''/>
							</header>
							<module/>
							<main/>
							</canvasData>
			var element:XML;
			for each (var vo:ElementVO in allElementVOes)
			{
				element = XML(ShapeCreator.propertiesMap[vo.type]).copy();
				element.@id = vo.id;
				for each(var node:XML in element.attributes())
					element.@[node.name()] = vo[node.name().toString()];
				
//				element.@color = uint(element.@color).toString(16);
//				trace(element.@color);
				xml.main.appendChild(element);
			}
			xml.header.blackground.@style = style.currentStyleType;
			xml.header.blackground.@color = uint(canvasColor).toString(16);
			return xml;
		}
		
		/**
		 * 所有数据映射
		 */
		public function dataMapping(xml:XML):void
		{
			canvasColor = uint("0x" + String(xml.header.blackground.@color));
			style.currentStyleType = xml.header.blackground.@style;
			
			for each(var item:XML in xml.main.children())
			{
				var vo:ElementVO = ShapeCreator.getShapeVO(item.name().toString());
				
				XMLVOMapper.fuck(item, vo);
				vo.type = item.name().toString();
				var currentStyle:XML = XML(XMLVOLib.getXML('stylesDefault', style.currentStyleType)).copy();
				var elementStyle:XML;
				switch(vo.type)
				{
					case ElementTypes.LINE:
						elementStyle = XML(XMLVOMapper.extendFrom(currentStyle.child("shapes")[0], XML(XMLVOLib.getXML('shapes',vo.styleTempType)))).copy();
						break;
					case ElementTypes.TEXT:
						elementStyle = XML(XMLVOMapper.extendFrom(currentStyle.child("texts")[0], XML(XMLVOLib.getXML('texts',vo.styleTempType)))).copy();
						break;
					case ElementTypes.IMAGE:
						elementStyle = XML(XMLVOMapper.extendFrom(currentStyle.child("images")[0], XML(XMLVOLib.getXML('images',vo.styleTempType)))).copy();
						break;
					case ElementTypes.GROUP:
						break;
					default:
						elementStyle = XML(XMLVOMapper.extendFrom(currentStyle.child("shapes")[0], XML(XMLVOLib.getXML('shapes',vo.styleTempType)))).copy();
						break;
				}
				
				XMLVOMapper.fuck(elementStyle, vo);
				addElement(vo);
			}
		}
		
		/**
		 * 设置所有元素样式
		 * @param xml
		 * 
		 */
		public function setAllElementStyle(xml:XML):void
		{
			var shapes:XML = XML(xml.child("shapes")[0]).copy();
			var lines:XML = XML(xml.child("lines")[0]).copy();
			var images:XML = XML(xml.child("images")[0]).copy();
			var texts:XML = XML(xml.child("texts")[0]).copy();
			
			for (var i:int = 0; i < allElementVOes.length; i++) 
			{
				
				switch(allElementVOes[i].type)
				{
					case ElementTypes.LINE:
						var linesChild:XML = XMLVOMapper.extendFrom(lines, XML(XMLVOLib.getXML('lines',allElementVOes[i].styleTempType)));
						XMLVOMapper.fuck(linesChild,allElementVOes[i]);
						break;
					case ElementTypes.TEXT:
						var textChild:XML = XMLVOMapper.extendFrom(texts, XML(XMLVOLib.getXML('texts',allElementVOes[i].styleTempType)))
						XMLVOMapper.fuck(textChild,allElementVOes[i]);
						break;
					case ElementTypes.IMAGE:
						var imageChild:XML = XMLVOMapper.extendFrom(images, XML(XMLVOLib.getXML('images',allElementVOes[i].styleTempType)))
						XMLVOMapper.fuck(imageChild,allElementVOes[i]);
						break;
					case ElementTypes.GROUP:
//						XMLVOMapper.fuck(shapes,allElementVOes[i]);
						break;
					default:
						var shapeChild:XML = XMLVOMapper.extendFrom(shapes, XML(XMLVOLib.getXML('shapes',allElementVOes[i].styleTempType)))
						XMLVOMapper.fuck(shapeChild,allElementVOes[i]);
						break;
				}
			}
			
		}
		
		/**
		 * 设置当前元素
		 * @param value
		 */
		public function set currentElementVO(value:ElementVO):void 
		{
			_currentElementVO = value;
		}
		
		/**
		 * 获取当前元素
		 * @return 
		 */
		public function get currentElementVO():ElementVO 
		{
			return _currentElementVO;
		}
	}
}