package panels.popertyPanelModes
{
	import panels.PropertyPanel;

	/**
	 * @author wallen
	 * 
	 * 仅仅靠属性面板的状态模式还无法完全满足不同状态下的功能需求，
	 * 
	 * 所以再此基础上又增添了状态基去完整的控制状态特征。
	 */	
	public class PropertyStateBase
	{
		public static const STAGE:String = "stage";
		public static const SHAPE:String = "shape";
		public static const TEXT:String = "text";
		public static const IMAGE:String = "image";
		public static const GROUP:String = "group";
		public static const LINE:String = "line";
		public static const CONNECT:String = "connect";
		public static const TEMPGROUP:String = "tempGroup";
		public static const TEMPGROUPLINE:String = "tempGroupLine";
		public static const TEMPGROUPTEXT:String = "tempGroupText";
		
		/**
		 */		
		public function PropertyStateBase(propertyPanel:PropertyPanel)
		{
			this.propertyPanel = propertyPanel;
		}
		
		//×××××××××××××××××××××××××××××××××××
		//
		// 状态切换
		//
		//×××××××××××××××××××××××××××××××××××
		public function toStageState():void
		{
			
		}
		
		public function toShapeState():void
		{
			
		}
		
		public function toTextState():void
		{
			
		}
		
		public function toImageState():void
		{
			
		}
		
		public function toGroupState():void
		{
			
		}
		
		public function toLineState():void
		{
			
		}
		
		public function toConnectState():void
		{
			
		}
		
		public function toTempGroupState():void
		{
			
		}
		
		public function toTempGroupLineState():void
		{
			
		}
		
		public function toTempGroupTextState():void
		{
			
		}
		
		/**
		 */		
		protected var propertyPanel:PropertyPanel;
	}
}