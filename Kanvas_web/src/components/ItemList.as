package components
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import skins.ItemListSkin;
	
	import mx.events.FlexEvent;
	
	import spark.components.DropDownList;
	
	[SkinState("over")]
	public class ItemList extends DropDownList
	{
		//是否被点击
		private var _clicked:Boolean = false;
		
		public function ItemList()
		{
			super();
			setStyle('skinClass', ItemListSkin);
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
		}
		
		override protected function commitProperties():void{
			super.commitProperties();
			if(selectedItem){
				if(selectedItem is Class && openButton.iconDisplay){
					openButton.setStyle('icon', selectedItem);
				}else{
					if(selectedItem is String){
						openButton.label = selectedItem;
					}else{
						openButton.label = selectedItem[labelField];
					}
				}
			}else{
				openButton.label = '';
			}
		}
	}
}