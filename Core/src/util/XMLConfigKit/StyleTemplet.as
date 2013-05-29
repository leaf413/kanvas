package util.XMLConfigKit
{
	public class StyleTemplet
	{
		
		/**
		 *当前样式模版类型 
		 */
		public var currentStyleType:String = '';
		
		public function StyleTemplet()
		{
		}
		
		/**
		 * 模版解析器
		 * @param temple
		 * @param type
		 * @param templeXML
		 * @return 
		 * 
		 */
		public function templeChangeElement(type:String, templeXML:XML, childXML:XML):XML
		{
			var elementStyle:XML = new XML();
			
			for each(var item:XML in templeXML.child(type))
				elementStyle = XMLVOMapper.extendFrom(item,childXML);
			
			
			return elementStyle;
		}
		
		public var currentShapeStyle:XML = <default>
												<style />
											</default>
			
		public var currentTextStyle:XML =  <default>
												<style />
											</default>
			
		public var currentimageStyle:XML =  <default>
										<style />
									</default>
			
		public var currentlineStyle:XML = <default>
										<style />
									</default>
			
	}
}