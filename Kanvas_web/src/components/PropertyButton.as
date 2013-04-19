package components
{
	import flash.events.MouseEvent;
	
	import flashx.textLayout.elements.BreakElement;
	
	import knowledgeMapEditor.controlIcons.*;
	
	import mx.collections.ArrayCollection;
	
	import skins.PropertyButtonSkin;
	
	import spark.components.supportClasses.ButtonBase;
	
	[SkinState("selected")]
	public class PropertyButton extends ButtonBase
	{
		private var _lock:Boolean = false;

		[Bindable]
		public function get lock():Boolean
		{
			return _lock;
		}

		public function set lock(value:Boolean):void
		{
			_lock = value;
			if (lock)
			{
				toolTip = "解锁";
			}
			else
			{
				toolTip = _selectedItem.name;
			}
			invalidateSkinState();
		}
		
		private var _selected:Boolean = false;

		[Bindable]
		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
			invalidateSkinState();
		}
		
		private var _selectedItem:*;
		
		public function get selectedItem():*
		{
			return _selectedItem;
		}
		
		private var _selectedIndex:uint = 0;

		public function get selectedIndex():uint
		{
			return _selectedIndex;
		}

		public function set selectedIndex(value:uint):void
		{
			_selectedIndex = value;
			_selectedItem = _data.getItemAt(_selectedIndex);
			if (lock)
			{
				toolTip = "解锁";
			}
			else
			{
				toolTip = _selectedItem.name;
			}
			
			invalidateSkinState();
		}
		
		private var _data:ArrayCollection = new ArrayCollection([
			{name: "画布颜色", icon: null, overIcon: prop_btn_icon_bg_over, downIcon: null, selectedIcon: null}
			,  {name: "形状面板", icon: prop_btn_icon_shape, overIcon: prop_btn_icon_shape_over, downIcon: prop_btn_icon_shape_selected, selectedIcon: prop_btn_icon_shape_selected}
			,  {name: "图片面板", icon: prop_btn_icon_image, overIcon: prop_btn_icon_image_over, downIcon: prop_btn_icon_image_selected, selectedIcon: prop_btn_icon_image_selected}
			,  {name: "群组面板", icon: prop_btn_icon_group, overIcon: prop_btn_icon_group_over, downIcon: prop_btn_icon_group_selected, selectedIcon: prop_btn_icon_group_selected}
			,  {name: "线条面板", icon: prop_btn_icon_line, overIcon: prop_btn_icon_line_over, downIcon: prop_btn_icon_line_selected, selectedIcon: prop_btn_icon_line_selected}
			,  {name: "文字面板", icon: prop_btn_icon_text, overIcon: prop_btn_icon_text_over, downIcon: prop_btn_icon_text_selected, selectedIcon: prop_btn_icon_text_selected}
		]);
		
		public function PropertyButton()
		{
			super();
			selectedIndex = 0;
			setStyle('skinClass', PropertyButtonSkin);
		}

		/*override protected function partAdded(partName:String, instance:Object):void
		{
			if(instance == iconDisplay)
			{
				iconDisplay.source = _selectedItem.icon;
			}
		}*/
		
		/*public function set dataProvider(d:ArrayCollection):void
		{
			_data = d;
		}*/
		
		override protected function stateChanged(oldState:String, newState:String, recursive:Boolean):void{
			super.stateChanged(oldState, newState, recursive);
			
			switch(newState){
				case 'up':
					iconDisplay.source = _lock ? prop_btn_icon_lock : (_selected ? _selectedItem.selectedIcon : _selectedItem.icon);
					break;
				case 'over':
					iconDisplay.source = _lock ? prop_btn_icon_lock_over : _selectedItem.overIcon;
					break;
				case 'down':
					iconDisplay.source = _lock ? prop_btn_icon_lock_selected : _selectedItem.downIcon;
					break;
				case 'selected':
					iconDisplay.source = _lock ? prop_btn_icon_lock_selected : (_selectedItem.selectedIcon || _selectedItem.icon);
					break;
				default:
					iconDisplay.source = _lock ? prop_btn_icon_lock : (_selected ? _selectedItem.selectedIcon : _selectedItem.icon);
			}
		}
		
		override protected function getCurrentSkinState():String
		{
			var s:String = super.getCurrentSkinState();
			if(s != "over" && s != "down" && _selected)
			{
				return "selected";
			}
			return s;
		}
	}
}